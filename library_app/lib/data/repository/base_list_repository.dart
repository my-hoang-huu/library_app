import 'package:flutter/foundation.dart';
import 'package:library_app/data/models/base_modal.dart';
import 'package:library_app/data/models/reader_modal.dart';
import 'package:library_app/data/service/service.dart';

import '../models/book.dart';

abstract class BaseListRepository<T extends BaseModal> {
  List<T>? _info;

  final BaseService _service = BaseService();

  Future<List<T>?> get info async {
    if (_info != null) {
      return _info;
    } else {
      _info = await _fetchData();
    }
    return _info;
  }

  Future<List<T>> _fetchData();

  Future<List<T>> createNew(T modal);

  Future<List<T>> updateInfo(T modal);

  Future<List<T>> delete(int id);

  void _replace(T modal) {
    if (_info == null) {
      return;
    }
    for (var i = 0; i < _info!.length; i++) {
      if (_info![i].id == modal.id) {
        _info![i] = modal;
        return;
      }
    }
  }

  void _deleteItem(int id) {
    if (_info == null) {
      return;
    }
    for (var i = 0; i < _info!.length; i++) {
      if (_info![i].id == id) {
        _info!.removeAt(i);
        return;
      }
    }
  }

  void _addItem(T modal) {
    if (_info == null) {
      return;
    }
    _info!.add(modal);
  }
}

class BookListRepository extends BaseListRepository<Book> {
  @override
  Future<List<Book>> _fetchData() async {
    return Future.value(List.generate(
        3,
        (index) => Book(
            description:
                "A book description is a short summary of a book's story or content that is designed to “hook” a reader and lead to a sale. Typically, the book's description conveys important information about its topic or focus (in nonfiction) or the plot and tone (for a novel or any other piece of fiction",
            id: index,
            image: "assets/images/book01.png",
            name: "test",
            price: 2,
            pageCount: 200,
            isPopular: true,
            author: "My")));

    ///real function
    final List mapData = await _service.fetchInfo('/book-management/books');
    if (kDebugMode) {
      print(["base_repository: ", mapData]);
    }
    return mapData.map((e) => Book.fromMap(e)).toList();
  }

  @override
  Future<List<Book>> updateInfo(Book modal) async {
    final isSuccess =
        await _service.updateInfo('/book-management/book/${modal.id}', updateMap: modal.toMap());
    if (kDebugMode) {
      print(["base_repository: ", isSuccess]);
    }
    if (isSuccess) {
      _replace(modal);
    }
    return _info!;
  }

  @override
  Future<List<Book>> createNew(Book modal) async {
    final response =
        await _service.createNewInfo('/book-management/book', newMapInfo: modal.toMap());
    if (kDebugMode) {
      print(["base_repository: ", response]);
    }
    _addItem(modal);
    return _info!;
  }

  @override
  Future<List<Book>> delete(int id) async {
    final isSuccess = await _service.deleteInfo('/book-management/book/$id', id: id.toString());
    if (isSuccess) {
      _deleteItem(id);
    }
    return _info!;
  }
}

class ReaderListRepository extends BaseListRepository<Reader> {
  @override
  Future<List<Reader>> _fetchData() async {
    return Future.value(List.generate(
        3,
        (index) => Reader(
            id: index,
            name: "Hoàng Hữu My",
            studentCode: '400000',
            className: "Đại học công nghệ thông tin tp HCM",
            gender: "Name")));

    ///real function
    final List mapData = await _service.fetchInfo('/student-management/students');
    return mapData.map((e) => Reader.fromMap(e)).toList();
  }

  @override
  Future<List<Reader>> updateInfo(Reader modal) async {
    final isSuccess = await _service.updateInfo('/student-management/student/${modal.id}',
        updateMap: modal.toMap());

    if (isSuccess) {
      _replace(modal);
    }
    return _info!;
  }

  @override
  Future<List<Reader>> createNew(Reader modal) async {
    final response =
        await _service.createNewInfo('/student-management/student', newMapInfo: modal.toMap());
    _addItem(modal);
    return _info!;
  }

  @override
  Future<List<Reader>> delete(int id) async {
    final isSuccess =
        await _service.deleteInfo('/student-management/student/$id', id: id.toString());
    if (isSuccess) {
      _deleteItem(id);
    }
    return _info!;
  }
}
