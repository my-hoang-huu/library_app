// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Reader {
  final int id;
  final String name;
  final String studentCode;
  final String gender;
  final String className;
  Reader({
    required this.id,
    required this.name,
    required this.studentCode,
    required this.gender,
    required this.className,
  });

  Reader copyWith({
    int? id,
    String? name,
    String? studentCode,
    String? gender,
    String? className,
  }) {
    return Reader(
      id: id ?? this.id,
      name: name ?? this.name,
      studentCode: studentCode ?? this.studentCode,
      gender: gender ?? this.gender,
      className: className ?? this.className,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'studentCode': studentCode,
      'gender': gender,
      'className': className,
    };
  }

  factory Reader.fromMap(Map<String, dynamic> map) {
    return Reader(
      id: map['id'] as int,
      name: map['name'] as String,
      studentCode: map['studentCode'] as String,
      gender: map['gender'] as String,
      className: map['className'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reader.fromJson(String source) =>
      Reader.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Reader(id: $id, name: $name, studentCode: $studentCode, gender: $gender, className: $className)';
  }

  @override
  bool operator ==(covariant Reader other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.studentCode == studentCode &&
        other.gender == gender &&
        other.className == className;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        studentCode.hashCode ^
        gender.hashCode ^
        className.hashCode;
  }
}
