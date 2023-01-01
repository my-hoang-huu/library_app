from flask import Blueprint
from .services import (add_user_service, get_user_by_id_service,
                       get_all_users_service, update_user_by_id_service,
                       delete_user_by_id_service)
users = Blueprint("users", __name__)

# add a new user


@users.route("/user-management/user", methods=['POST'])
def add_user():
    return add_user_service()

# get user by id


@users.route("/user-management/user/<int:id>", methods=['GET'])
def get_user_by_id(id):
    return get_user_by_id_service(id)

# get all user


@users.route("/user-management/users", methods=['GET'])
def get_all_users():
    return get_all_users_service()

# update user


@users.route("/user-management/user/<int:id>", methods=['PUT'])
def update_user_by_id(id):
    return update_user_by_id_service(id)


# delete user


@users.route("/user-management/user/<int:id>", methods=['DELETE'])
def delete_user_by_id(id):
    return delete_user_by_id_service(id)

