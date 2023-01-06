from flask import Blueprint
from .services import (add_image, get_image_by_id_service,
                       update_image_by_id_service,
                       delete_image_by_id_service, add_image_service)
images = Blueprint("images", __name__)

# add a new image


@images.route("/image-management/image", methods=['POST'])
def add_image():
    return add_image_service()

# get image by id


@images.route("/image-management/image/<int:id>", methods=['GET'])
def get_image_by_id(id):
    return get_image_by_id_service(id)

# update image

@images.route("/image-management/image/<int:id>", methods=['PUT'])
def update_image_by_id(id):
    return update_image_by_id_service(id)


# delete image


@images.route("/image-management/image/<int:id>", methods=['DELETE'])
def delete_image_by_id(id):
    return delete_image_by_id_service(id)
