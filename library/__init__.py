from flask import Flask, request, Blueprint
from .books.controller import books
from .students.controller import students
from .borrow.controller import borrow
from .user.controller import users
from .extension import db, ma
from .model import Students, Books, Author, Category, Borrows
import os


def create_db():
    if not os.path.exists("instance/library.db"):
        db.create_all()
        print("Created DB!.!")

def create_app(config_file = "config.py"):
    app = Flask(__name__)
    app.config.from_pyfile(config_file)
    db.init_app(app)
    ma.init_app(app)
    with app.app_context():
        create_db()
    app.register_blueprint(books)
    app.register_blueprint(students)
    app.register_blueprint(borrow)
    app.register_blueprint(users)
    return app