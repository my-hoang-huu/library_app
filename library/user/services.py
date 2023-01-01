from library.extension import db
from library.library_ma import UserSchema
from library.model import Author, Users, Category
from flask import request, jsonify
from sqlalchemy.sql import func
import json

user_schema = UserSchema()
users_schema = UserSchema(many=True)


def add_user_service():
    data = request.json
    if (data and ('name' in data) and ('user_code' in data)
            and ('gender' in data) and ('class_name' in data)):
        name = data['name']
        user_code = data['user_code']
        gender = data['gender']
        class_name = data['class_name']
        try:
            new_user = Users(name, user_code, gender, class_name)
            db.session.add(new_user)
            db.session.commit()
            return jsonify({"message": "Add success!"}), 200
        except IndentationError:
            db.session.rollback()
            return jsonify({"message": "Can not add user!"}), 400
    else:
        return jsonify({"message": "Request error"}), 400


def get_user_by_id_service(id):
    user = Users.query.get(id)
    if user:
        return user_schema.jsonify(user)
    else:
        return jsonify({"message": "Not found user"}), 404


def get_all_users_service():
    users = Users.query.all()
    if users:
        return users_schema.jsonify(users)
    else:
        return jsonify({"message": "Not found users!"}), 404


def update_user_by_id_service(id):
    user = Users.query.get(id)
    data = request.json
    if user:
        if data and "user_code" in data:
            try:
                user.user_code = data["user_code"]
                db.session.commit()
                return "User Updated"
            except IndentationError:
                db.session.rollback()
                return jsonify({"message": "Can not delete user!"}), 400
    else:
        return "Not found user"


def delete_user_by_id_service(id):
    user = Users.query.get(id)
    if user:
        try:
            db.session.delete(user)
            db.session.commit()
            return "User Deleted"
        except IndentationError:
            db.session.rollback()
            return jsonify({"message": "Can not delete user!"}), 400
    else:
        return "Not found user"


