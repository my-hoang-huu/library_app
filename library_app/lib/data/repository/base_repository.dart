import 'package:library_app/data/models/Book.dart';
import 'package:library_app/data/models/base_modal.dart';

abstract class BaseRepository<T extends BaseModal> {
  T? _info;

  /// DEMO

  Future<T?> get info async {
    if (_info != null) {
      return Future.value(_info);
    } else {
      _info = await _fetchData();
      return _info;
    }
  }

  Future<T> _fetchData();

  Future<T?> updateInfo(T modal);

  Future<bool?> createNew(T modal);

  Future<bool?> delete(T modal);
}

class BookRepository extends BaseRepository<Book> {
  Future<Book> _fetchData() async {
    await Future.delayed(Duration(seconds: 1));

    /// DEMO
    // final jsonData = await _service.fetchInfo('/profile/details');
    // _userInfo = Book.fromJson(jsonData);

    return _info!;
  }

  Future<Book?> updateInfo(Book info) async {
    /// DEMO
    // final jsonData = await _service.updateInfo('/profile/details', jsonProfile: info.toJson());
    // _userInfo = Book.fromJson(jsonData);
    await Future.delayed(Duration(seconds: 1));
    return info;
  }

  @override
  Future<bool?> createNew(Book modal) {
    // TODO: implement createNew
    throw UnimplementedError();
  }

  @override
  Future<bool?> delete(Book modal) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
