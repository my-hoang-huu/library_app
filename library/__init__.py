from flask import Flask, request, Blueprint
from .books.controller import books
from .extension import db
from .model import Students, Books, Author, Category, Borrows
import os


def create_db():
    if not os.path.exists("library/library.db"):
        db.create_all()
        print("Created DB!!!")

def create_app(config_file = "config.py"):
    app = Flask(__name__)
    app.config.from_pyfile(config_file)
    db.init_app(app)
    with app.app_context():
        create_db()
    app.register_blueprint(books)
    return app