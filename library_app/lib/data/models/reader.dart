// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:library_app/data/models/base_modal.dart';

class Reader extends BaseModal {
  final String name;
  final String studentCode;
  final String? gender;
  final String university;
  final String image;
  Reader(
      {required super.id,
      required this.name,
      required this.studentCode,
      required this.university,
      this.gender,
      this.image = "assets/images/avatar.png"});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'studentCode': studentCode,
      'gender': gender,
      'className': university,
    };
  }

  factory Reader.fromMap(Map<String, dynamic> map) {
    return Reader(
      id: map['id'] as int,
      name: map['name'] as String,
      studentCode: map['studentCode'] as String,
      gender: map['gender'] != null ? map['gender'] as String : null,
      university: map['className'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reader.fromJson(String source) =>
      Reader.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Reader(name: $name, studentCode: $studentCode, gender: $gender, className: $university)';
  }

  @override
  bool operator ==(covariant Reader other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.studentCode == studentCode &&
        other.gender == gender &&
        other.university == university;
  }

  @override
  int get hashCode {
    return name.hashCode ^ studentCode.hashCode ^ gender.hashCode ^ university.hashCode;
  }

  Reader copyWith({
    String? name,
    String? studentCode,
    String? gender,
    String? className,
    String? image,
  }) {
    return Reader(
      id: super.id,
      name: name ?? this.name,
      studentCode: studentCode ?? this.studentCode,
      gender: gender ?? this.gender,
      university: className ?? this.university,
      image: image ?? this.image,
    );
  }
}
