import 'package:flutter/foundation.dart';
import 'package:library_app/data/models/base_modal.dart';
import 'package:library_app/data/models/list_book.dart';
import 'package:library_app/data/service/service.dart';

import '../models/book.dart';

abstract class BaseRepository<T extends BaseModal> {
  T? _info;

  final BaseService _service = BaseService();

  Future<T?> get info async {
    if (_info != null) {
      return _info;
    } else {
      _info = await _fetchData();
    }
    return _info;
  }

  Future<T> _fetchData();

  Future<bool?> createNew(T modal);

  Future<bool?> updateInfo(T modal);

  Future<bool?> delete(T modal);
}

class BookRepository extends BaseRepository<Book> {
  @override
  Future<Book> _fetchData() async {
    final Map<String, dynamic> mapData = await _service.fetchInfo('/book-management/books');
    if (kDebugMode) {
      print(["base_repository: ", mapData]);
    }
    return Book.fromMap(mapData);
  }

  @override
  Future<bool?> createNew(Book modal) async {
    final result =
        await _service.createNewInfo('/book-management/book/${modal.id}', updateMap: modal.toMap());
    if (kDebugMode) {
      print(["base_repository: ", result]);
    }
    return result != null;
  }

  @override
  Future<bool?> delete(Book modal) async {
    final mapData =
        await _service.deleteInfo('/book-management/book/${modal.id}', id: modal.id.toString());
    if (kDebugMode) {
      print(["base_repository: ", mapData]);
    }
    return true;
  }

  @override
  Future<bool?> updateInfo(Book modal) async {
    final mapData =
        await _service.updateInfo('/book-management/book/${modal.id}', updateMap: modal.toMap());
    if (kDebugMode) {
      print(["base_repository: ", mapData]);
    }
    return true;
  }
}

class BookListRepository extends BaseRepository<BookList> {
  @override
  Future<BookList> _fetchData() async {
    return Future.value(BookList(List.generate(
        3,
        (index) => Book(
            description: "",
            id: index,
            image: "assets/images/book01.png",
            name: "test",
            price: 2,
            pageCount: 200,
            isPopular: true,
            author: "My"))));

    ///real function
    final List mapData = await _service.fetchInfo('/book-management/books');
    if (kDebugMode) {
      print(["base_repository: ", mapData]);
    }
    return BookList.fromMap(mapData);
  }

  @override
  Future<bool?> createNew(BookList modal) async {
    // final result =
    //     await _service.createNewInfo('/book-management/book/${modal.id}', updateMap: modal.toMap());
    // if (kDebugMode) {
    //   print(["base_repository: ", result]);
    // }
    // return result != null;
    return false;
  }

  @override
  Future<bool?> delete(BookList modal) async {
    // final mapData =
    //     await _service.deleteInfo('/book-management/book/${modal.id}', id: modal.id.toString());
    // if (kDebugMode) {
    //   print(["base_repository: ", mapData]);
    // }
    return true;
  }

  @override
  Future<bool?> updateInfo(BookList modal) async {
    // final mapData =
    //     await _service.updateInfo('/book-management/book/${modal.id}', updateMap: modal.toMap());
    // if (kDebugMode) {
    //   print(["base_repository: ", mapData]);
    // }
    return true;
  }
}
