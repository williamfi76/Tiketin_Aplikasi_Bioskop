from flask import Flask, redirect, url_for
from features.account.controller import accountController
from features.admin.controller import adminController
from features.admin.controller.adminController import admin_bp
from features.member.controller.memberController import member_bp
from features.account.controller.accountController import account_bp



def main():
    app = Flask(__name__)
    app.register_blueprint(admin_bp)
    app.register_blueprint(member_bp)
    app.register_blueprint(account_bp)
    app.secret_key = "secret_code"
    adminController.updateShowing()

    @app.route("/")
    def index():
        return redirect(url_for('login_route'))
    
    @app.route("/login", methods=['GET', 'POST'])
    def login_route():
        return accountController.show_login()
    
    @app.route("/register", methods=['GET','POST'])
    def register_route():
        return accountController.show_register()
    
    app.add_url_rule('/logout', 'logout', accountController.logout)
    app.run(debug=True)

if __name__ == '__main__':
    main()