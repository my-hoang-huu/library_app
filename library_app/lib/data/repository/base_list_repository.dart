import 'package:flutter/foundation.dart';
import 'package:library_app/data/models/base_modal.dart';
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

  Future<bool?> createNew(T modal);

  Future<List<T>> updateInfo(T modal);

  Future<bool?> delete(T modal);

  void replace(T modal) {
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
}

class BookListRepository extends BaseListRepository<Book> {
  @override
  Future<List<Book>> _fetchData() async {
    // return Future.value(List.generate(
    //     3,
    //     (index) => Book(
    //         description: "",
    //         id: index,
    //         image: "assets/images/book01.png",
    //         name: "test",
    //         price: 2,
    //         pageCount: 200,
    //         isPopular: true,
    //         author: "My")));

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
      replace(modal);
    }
    return _info!;
  }

  @override
  Future<bool?> createNew(Book modal) async {
    // final result =
    //     await _service.createNewInfo('/book-management/book/${modal.id}', updateMap: modal.toMap());
    // if (kDebugMode) {
    //   print(["base_repository: ", result]);
    // }
    // return result != null;
    return false;
  }

  @override
  Future<bool?> delete(Book modal) async {
    // final mapData =
    //     await _service.deleteInfo('/book-management/book/${modal.id}', id: modal.id.toString());
    // if (kDebugMode) {
    //   print(["base_repository: ", mapData]);
    // }
    return true;
  }
}
