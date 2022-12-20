from flask import Flask, request, Blueprint

def create_app():
    app = Flask(__name__)
    return app