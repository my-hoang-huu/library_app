// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:library_app/data/models/base_modal.dart';

import 'book.dart';

class BookList extends BaseModal {
  final List<Book> bookList;

  BookList(
    this.bookList,
  );

  BookList copyWith({
    List<Book>? bookList,
  }) {
    return BookList(
      bookList ?? this.bookList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookList': bookList.map((x) => x.toMap()).toList(),
    };
  }

  factory BookList.fromMap(List maps) {
    return BookList(
      List<Book>.from(
        maps.map<Book>(
          (x) => Book.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookList.fromJson(String source) => BookList.fromMap(json.decode(source) as List);

  @override
  String toString() => 'ListOfBook(bookList: $bookList)';

  @override
  bool operator ==(covariant BookList other) {
    if (identical(this, other)) return true;

    return listEquals(other.bookList, bookList);
  }

  @override
  int get hashCode => bookList.hashCode;
}
