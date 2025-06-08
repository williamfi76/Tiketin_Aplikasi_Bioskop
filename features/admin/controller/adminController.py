import os
import re
from datetime import datetime
from typing import List

from flask import Blueprint, redirect, render_template, request, session, url_for

from features.account.controller import accountController
from features.movie.model.genre import Genre
from features.movie.model.movie import Movie
from features.movie.model.movieStatus import MovieStatus
from features.studio.model.studio import Studio
from shared.db import mysqlConnector
from shared.enum.role import Role

admin_bp = Blueprint('admin', __name__, url_prefix='/admin', template_folder="../view", static_folder="../view", static_url_path="/admin")

@admin_bp.route("/add-new-showing", methods=["POST", 'GET'])
def showAddNewShowing():
    if "id" not in session:
        return redirect(url_for("logout"))
    movies = getAllMovies()
    studios = getAllStudios()
    if request.method == "POST":
        movie_id = int(request.form.get("movie_name"))
        studio_id = int(request.form.get("studio_name"))
        start_time = datetime.strptime(request.form.get("start_time"), "%Y-%m-%dT%H:%M")
        end_time = datetime.strptime(request.form.get("end_time"), "%Y-%m-%dT%H:%M")

        if addNewShowing(movie_id, start_time, end_time, studio_id):
            return redirect(url_for("admin.showStudioBooking"))
        return redirect(url_for("logout"))
    return render_template("add-new-showing.html", movies=movies, studios=studios)

@admin_bp.route("/studio-booking", methods=["POST", "GET"])
def showStudioBooking():
    try:
        db = mysqlConnector.connect()
        cursor = db.cursor()
        movie_name = request.args.get("movie_name")
        movie_names = getMovieNames()
        input_studio = request.args.get("studio")
        date = request.args.get("date")
        query = """
            SELECT m.name, st.name, s.start_time from showing s
            JOIN movie m ON s.movie_id=m.id
            JOIN studio st ON st.id=s.studio_id
            WHERE NOW() < s.start_time
        """

        filters = []
        params = {}

        if movie_name:
            filters.append("m.name = %(movie_name)s")
            params["movie_name"] = movie_name

        if input_studio:
            filters.append("st.name = %(studio)s")
            params["studio"] = input_studio

        if date:
            filters.append("DATE(s.start_time) = %(date)s")
            params["date"] = date

        if filters:
            query += " AND " + " AND ".join(filters)
        
        query += " ORDER BY s.start_time ASC"

        # Execute query with parameters
        cursor.execute(query, params)
        movie_data = []
        for movie in cursor.fetchall():
            movie_data.append([movie[0], movie[1], movie[2]])
        return render_template("add_show_booking.html", movie_datas=movie_data, movie_name=movie_name, movie_names=movie_names, date=date, input_studio=input_studio, studios=getStudioNames())
    except Exception as e:
        print(e)
        db.rollback()
        return render_template("add_show_booking.html", movie_name=movie_name, movie_names=movie_names, date=date, input_studio=input_studio, studios=getStudioNames())
    finally:
        db.close()

@admin_bp.route("/add-new-movie", methods=["POST", "GET"])
def showAddNewMovie():
    if "id" not in session:
        return redirect(url_for("logout"))

    if request.method == "POST":
        if 'poster' not in request.files:
            return 'No file part'
        file = request.files['poster']
        if file.filename == '':
            return 'No selected file'
        movieName = request.form["title"]
        movieDuration = int(request.form["duration"])
        movieDesc = request.form["description"]
        movieGenres = request.form.getlist("genre")
        genreObjects = []
        filename = re.sub(r"[\'\";,.!?@#$%^&*]", "", movieName).lower().replace(" ", "_").replace(":", "-")
        filename += ".png"
        base_dir = os.path.dirname(os.path.abspath(__file__))
        filepath = os.path.join(base_dir, "..", "..", "..", "static", "asset", "poster", filename)
        filepath = filepath.replace("\\", "/")
        rootFolder = ""
        try:
            db = mysqlConnector.connect()
            for i in movieGenres:
                genreObjects.append(Genre(int(i)))
            if not addNewMovie(movieName, movieDesc, movieDuration,genreObjects):
                return render_template("add_new_movie.html", genres=Genre, error="Gagal menambahkan film baru")
            file.save(filepath)
            db.commit()
            return redirect(url_for("admin.showShowingMovies"))
        except Exception as e:
            print(e)
            db.rollback()
            return render_template("add_new_movie.html", genres=Genre, error="Gagal menambahkan film baru")
        finally:
            db.close

    return render_template("add_new_movie.html", genres=Genre)

@admin_bp.route("/movies")
def showShowingMovies():
    movies = getAllMovies()
    return render_template("admin_showing_management.html", movies=movies)

@admin_bp.route("/")
def showAdminProfile():
    if "id" not in session:
        return redirect(url_for("login_route"))
    return render_template("admin_profile_page.html")

@admin_bp.route("/assign-admin", methods=["POST", "GET"])
def showAssignAdmin():
    if request.method == "POST":
        input_email = request.form["email"]
        if input_email == "":
            return render_template("assign_admin.html", error="Masukan Email")
        if not accountController.email_exists(input_email):
            return render_template("assign_admin.html", error="Email Tidak ditemukan")
        try:
            db = mysqlConnector.connect()
            cursor = db.cursor()
            query = """
                UPDATE account a SET a.role=%s
                WHere a.email=%s
            """
            cursor.execute(query, (Role.ADMIN.value, input_email))
            db.commit()
            return render_template("assign_admin.html", error="Berhasil Menambahkan Admin baru")
        except Exception as e:
            print(e)
            db.rollback()
            return render_template("assign_admin.html", error="Gagal mengassign Account")
        finally:
            db.close

    return render_template("assign_admin.html")

def getAllStudios():
    try:
        db = mysqlConnector.connect()
        cursor = db.cursor()
        studios = []
        query = "SELECT s.id, s.name, s.price_per_seat, s.row_count, s.column_count from studio s;"
        cursor.execute(query)
        for studio in cursor.fetchall():
            studios.append(Studio(studio[0], studio[1], studio[2], studio[3], studio[4]))
        return studios 
    except Exception as e:
        print(e)
        db.rollback()
        return []
    finally:
        db.close()


def getMovieNames():
    try:
        db = mysqlConnector.connect()
        cursor = db.cursor()
        query = "SELECT m.name from movie m ORDER BY m.status, m.name"
        cursor.execute(query)
        movie_names = []
        for studio_name in cursor.fetchall():
            movie_names.append(studio_name[0])
        return movie_names 
    except Exception as e:
        print(e)
        db.rollback()
        return []
    finally:
        db.close()

def updateShowing():
    try:
        db = mysqlConnector.connect()
        cursor = db.cursor()
        query = "SELECT DISTINCT s.movie_id from showing s WHERE s.start_time > NOW() "
        cursor.execute(query)
        movie_ids = []
        for movie_id in cursor.fetchall():
            movie_ids.append(movie_id[0])

        queryUpdate = "UPDATE movie SET status=0"
        cursor.execute(queryUpdate)

        placeholders = ', '.join("%s" for _ in movie_ids)

        sql = '''
            UPDATE movie
            SET status = 1
            WHERE id IN (
        '''
        sql = sql +  placeholders +  ")" 

        cursor.execute(sql, movie_ids)
        db.commit()

    except Exception as e:
        print(e)
        db.rollback()
    finally:
        db.close()

def getStudioNames():
    try:
        db = mysqlConnector.connect()
        cursor = db.cursor()
        movies = []
        query = "SELECT s.name from studio s"
        cursor.execute(query)
        studio_names = []
        for studio_name in cursor.fetchall():
            studio_names.append(studio_name[0])
        return studio_names 
    except Exception as e:
        print(e)
        db.rollback()
        return []
    finally:
        db.close()

def getAllMovies():
    try:
        db = mysqlConnector.connect()
        cursor = db.cursor()
        movies = []
        query = "SELECT m.id, m.name, m.description, m.duration, m.poster_img_path, m.status from movie m order by m.status DESC, m.name ASC"
        cursor.execute(query)
        for movie in cursor.fetchall():
            movies.append(Movie(movie[0], movie[1], movie[2], movie[3], movie[4],[],MovieStatus(movie[5])))
        return movies 
    except Exception as e:
        print(e)
        db.rollback()
        return []
    finally:
        db.close()

def addNewShowing(movieId:int, startTime:datetime, endTime:datetime, studioId:int):
    try:
        db = mysqlConnector.connect()
        cursor = db.cursor()
        cursor.execute("""
            UPDATE movie SET status=1 where id = %s;
        """, (movieId,))

        cursor.execute("""
            INSERT INTO showing (movie_id, start_time, end_time, studio_id)
            VALUES (%s, %s, %s, %s);
        """, (movieId, startTime, endTime, studioId))

        db.commit()
        return True

    except Exception as e:
        db.rollback()
        return False

    finally:
        db.close()

def assignRoleToAccount(memberId:int, role:Role):
    try:
        db = mysqlConnector.connect()
        cursor = db.cursor()
        query = f"UPDATE account SET role={role.value} WHERE id={memberId}"
        cursor.execute(query)
        db.commit()
        return True

    except Exception as e:
        db.rollback()
        return False

    finally:
        db.close()

def addNewMovie(name:str, description:str, duration:int, genres: List[Genre] = [], status:MovieStatus = MovieStatus.NOT_SHOWING):
    try:
        db = mysqlConnector.connect()
        cursor = db.cursor()

        # Masukkan data film ke tabel movie
        
        posterPath = re.sub(r"[\'\";,.!?@#$%^&*]", "", name).lower().replace(" ", "_").replace(":", "-")
        posterPath += ".png"
        cursor.execute("""
            INSERT INTO movie (name, description, duration, poster_img_path, status)
            VALUES (%s, %s, %s, %s, %s)
        """, (name, description, duration, posterPath, status.value))
        movie_id = cursor.lastrowid

        if len(genres) != 0:
            movie_genre = []
            for genre in genres:
                movie_genre.append(f"({movie_id}, {genre.value})")
            values_movie_genres = ", ".join(movie_genre)
            values_movie_genres += ";"
            query = f"INSERT INTO movie_genre (movie_id, genre_id) VALUES {values_movie_genres}"
            cursor.execute(query)

        db.commit()
        return True

    except Exception as e:
        db.rollback()
        print(e)
        return False

    finally:
        db.close()