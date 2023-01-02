from library.extension import db
from library.library_ma import StudentSchema
from library.model import Author, Students, Category
from flask import request, jsonify
from sqlalchemy.sql import func
import json

student_schema = StudentSchema()
students_schema = StudentSchema(many=True)


def add_student_service():
    data = request.json
    if (data and ('name' in data) and ('student_code' in data)
            and ('gender' in data) and ('class_name' in data)):
        name = data['name']
        student_code = data['student_code']
        gender = data['gender']
        class_name = data['class_name']
        try:
            new_student = Students(name, student_code, gender, class_name)
            db.session.add(new_student)
            db.session.commit()
            return jsonify({"message": "Add success!"}), 200
        except IndentationError:
            db.session.rollback()
            return jsonify({"message": "Can not add student!"}), 400
    else:
        return jsonify({"message": "Request error"}), 400


def get_student_by_id_service(id):
    student = Students.query.get(id)
    if student:
        return student_schema.jsonify(student)
    else:
        return jsonify({"message": "Not found student"}), 404


def get_all_students_service():
    students = Students.query.all()
    if students:
        return students_schema.jsonify(students)
    else:
        return jsonify({"message": "Not found students!"}), 404


def update_student_by_id_service(id):
    student = Students.query.get(id)
    data = request.json
    if student:
        if data:
            try:
                if("name" in data):
                    student.name = data["name"]
                if("student_code" in data):
                    student.student_code = data["student_code"]
                if("gender" in data):
                    student.gender = data["gender"]
                if("class_name" in data):
                    student.class_name = data["class_name"]
                db.session.commit()
                return "Student Updated"
            except IndentationError:
                db.session.rollback()
                return jsonify({"message": "Can not delete student!"}), 400
    else:
        return "Not found student"


def delete_student_by_id_service(id):
    student = Students.query.get(id)
    if student:
        try:
            db.session.delete(student)
            db.session.commit()
            return "Student Deleted"
        except IndentationError:
            db.session.rollback()
            return jsonify({"message": "Can not delete student!"}), 400
    else:
        return "Not found student"


