from library.extension import db
from library.library_ma import ImageSchema
from library.model import Author, Image, Category
from flask import Response, request, jsonify
from sqlalchemy.sql import func
from werkzeug.utils import secure_filename

image_schema = ImageSchema()
images_schema = ImageSchema(many=True)


def add_image_service():
    pic = request.files['image']
    if not pic:
        return 'No pic uploaded!', 400

    filename = secure_filename(pic.filename)
    mimetype = pic.mimetype
    if not filename or not mimetype:
        return 'Bad upload!', 400

    img = Image(img=pic.read(), name=filename, mimetype=mimetype)
    
    db.session.add(img)
    db.session.commit()

    return 'Upload image successfully', 200


def add_image(image):
    pic = image
    if not pic:
        return 'No pic uploaded!', 400

    filename = secure_filename(pic.filename)
    mimetype = pic.mimetype
    if not filename or not mimetype:
        return 'Bad upload!', 400

    img = Image(img=pic.read(), name=filename, mimetype=mimetype)
    db.session.add(img)
    db.session.commit()

    return img.id
    

def get_image_by_id_service(id):
    img = Image.query.filter_by(id=id).first()
    if not img:
        return 'Img Not Found!', 404

    return Response(img.img, mimetype=img.mimetype)
    



def update_image_by_id_service(id):
    image = Image.query.get(id)
    data = request.json
    if image:
        if data:
            try:
                if("name" in data):
                    image.name = data["name"]
                if("page_count" in data):
                    image.page_count = data["page_count"]
                if("author_id" in data):
                    image.author_id = data["author_id"]
                if("category_id" in data):
                    image.category_id = data["category_id"]
                db.session.commit()
                return "Images Updated"
            except IndentationError:
                db.session.rollback()
                return jsonify({"message": "Can not update image!"}), 400
    else:
        return "Not found image"


def delete_image_by_id_service(id):
    image = Image.query.get(id)
    if image:
        try:
            db.session.delete(image)
            db.session.commit()
            return "Images Deleted"
        except IndentationError:
            db.session.rollback()
            return jsonify({"message": "Can not delete image!"}), 400
    else:
        return "Not found image"

