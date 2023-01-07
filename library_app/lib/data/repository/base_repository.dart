import 'package:library_app/data/models/Book.dart';
import 'package:library_app/data/models/base_modal.dart';
import 'package:library_app/data/service/service.dart';

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

  Future<T?> updateInfo(T modal);

  Future<bool?> createNew(T modal);

  Future<bool?> delete(T modal);
}

class BookRepository extends BaseRepository<Book> {
  @override
  Future<Book> _fetchData() async {
    final Map<String, dynamic> mapData = await _service.fetchInfo('/book-management/book');
    print(["base_repository: ", mapData]);
    return Book.fromMap(mapData);
  }

  @override
  Future<bool?> createNew(Book modal) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> delete(Book modal) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Book?> updateInfo(Book modal) {
    // TODO: implement updateInfo
    throw UnimplementedError();
  }
}
