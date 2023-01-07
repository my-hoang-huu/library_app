abstract class ProfileDetail {
  final String userId;
  const ProfileDetail({required this.userId});
}

class UserUpdateInfo extends ProfileDetail {
  final String lastName;
  final String firstName;
  final String email;
  final String nickName;
  final String dateOfBirth;
  final int? phoneNumber;
  final String address;

  UserUpdateInfo(this.lastName, this.firstName, this.email, this.nickName, this.dateOfBirth,
      this.phoneNumber, this.address,
      {required super.userId});
}
