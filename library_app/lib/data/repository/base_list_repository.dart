import 'package:flutter/foundation.dart';
import 'package:library_app/data/models/base_modal.dart';
import 'package:library_app/data/models/reader.dart';
import 'package:library_app/data/service/service.dart';

import '../models/book.dart';

part 'book_list_repository.dart';
part 'reader_list_repository.dart';

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
