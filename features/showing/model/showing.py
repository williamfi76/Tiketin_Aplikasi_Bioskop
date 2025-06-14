from datetime import datetime

from features.movie.model.movie import Movie
from features.studio.model.studio import Studio


class Showing:
    def __init__(self, id, movie:Movie, studio:Studio, startingTime:datetime, endingTime:datetime):
        self.id = id
        self.movie = movie
        self.showingTime:datetime = startingTime
        self.endingTime:datetime = endingTime
        self.studio = studio

    def get_id(self):
        return self.id

    def set_id(self, value):
        self.id = value

    def get_movie(self):
        return self.movie

    def set_movie(self, value):
        self.movie = value

    def get_showingTime(self):
        return self.showingTime

    def set_showingTime(self, value):
        self.showingTime = value

    def get_endingTime(self):
        return self.endingTime

    def set_endingTime(self, value):
        self.endingTime = value

    def get_studio(self):
        return self.studio

    def set_studio(self, value):
        self.studio = value
