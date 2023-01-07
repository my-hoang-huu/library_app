import 'package:library_app/data/models/base_modal.dart';

abstract class ProfileDetailRepository<T extends ProfileDetail> {
  T? _userInfo;

  /// DEMO

  Future<T> get info async {
    if (_userInfo != null) {
      return Future.value(_userInfo);
    } else {
      _userInfo = await _fetchData();
      if (_userInfo == null) throw Exception("Đã có lỗi xảy ra khi tải dữ liệu");
      return _userInfo!;
    }
  }

  Future<T> _fetchData();

  Future<T?> updateInfo(T info);
}

class UserUpdateRepository extends ProfileDetailRepository<UserUpdateInfo> {
  Future<UserUpdateInfo> _fetchData() async {
    await Future.delayed(Duration(seconds: 1));

    /// DEMO
    // final jsonData = await _service.fetchInfo('/profile/details');
    // _userInfo = UserUpdateInfo.fromJson(jsonData);

    return _userInfo!;
  }

  Future<UserUpdateInfo?> updateInfo(UserUpdateInfo info) async {
    /// DEMO
    // final jsonData = await _service.updateInfo('/profile/details', jsonProfile: info.toJson());
    // _userInfo = UserUpdateInfo.fromJson(jsonData);
    await Future.delayed(Duration(seconds: 1));
    return info;
  }
}
