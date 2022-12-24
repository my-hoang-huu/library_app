from .extension import db

class Students(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(100), nullable = False)
    birth_date = db.Column(db.Date)
    gender = db.Column(db.String(10))
    class_name = db.Column(db.String(10))

    def __init__(sefl, name, birth_date, gender, class_name):
        sefl.name = name
        sefl.birth_date = birth_date
        sefl.gender = gender
        sefl.class_name = class_name


class Books(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(100), nullable = False)
    page_count = db.Column(db.Integer)
    author_id = db.Column(db.Integer, db.ForeignKey('author.id'))
    category_id = db.Column(db.Integer, db.ForeignKey('category.id'))

    def __init__(sefl, name, page_count, author_id, category_id):
        sefl.name = name
        sefl.page_count = page_count
        sefl.author_id = author_id
        sefl.category_id = category_id


class Borrows(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    book_id = db.Column(db.Integer, db.ForeignKey('books.id'))
    student_id = db.Column(db.Integer, db.ForeignKey('books.id'))
    borrow_date = db.Column(db.Date)
    return_date = db.Column(db.Date)

    def __init__(sefl, book_id, student_id, borrow_date, return_date):
        sefl.book_id =book_id
        sefl.student_id =student_id
        sefl.borrow_date =borrow_date
        sefl.return_date =return_date
        

class Category(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(100), unique = True, nullable = False)
    def __init__(seft, name):
        seft.name = name
        
        
class Author(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(100), unique = True, nullable = False)
    def __init__(seft, name):
        seft.name = name
    
        