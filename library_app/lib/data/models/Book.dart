import 'dart:convert';

import 'base_modal.dart';

class Book extends BaseModal {
  final int id;
  final String name;
  final bool? pageCount;
  final String description;
  final String image;
  final double? rating;
  final double? price;
  final bool? isFavourite;
  final bool? isPopular;
  final String? author;

  Book({
    required this.id,
    required this.name,
    this.pageCount,
    this.description = _description,
    this.image = "assets/images/book01.png",
    this.rating,
    this.price,
    this.isFavourite,
    this.isPopular,
    this.author,
  });

  Book copyWith({
    int? id,
    String? name,
    bool? pageCount,
    String? description,
    String? image,
    double? rating,
    double? price,
    bool? isFavourite,
    bool? isPopular,
    String? author,
  }) {
    return Book(
      id: id ?? this.id,
      name: name ?? this.name,
      pageCount: pageCount ?? this.pageCount,
      description: description ?? this.description,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      isFavourite: isFavourite ?? this.isFavourite,
      isPopular: isPopular ?? this.isPopular,
      author: author ?? this.author,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'pageCount': pageCount,
      'description': description,
      'image': image,
      'rating': rating,
      'price': price,
      'isFavourite': isFavourite,
      'isPopular': isPopular,
      'author': author,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'] as int,
      name: map['name'] as String,
      pageCount: map['pageCount'] != null ? map['pageCount'] as bool : null,
      description: map['description'],
      image: map['image'],
      rating: map['rating'] != null ? map['rating'] as double : null,
      price: map['price'] != null ? map['price'] as double : null,
      isFavourite: map['isFavourite'] != null ? map['isFavourite'] as bool : null,
      isPopular: map['isPopular'] != null ? map['isPopular'] as bool : null,
      author: map['author'] != null ? map['author'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) => Book.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Book(id: $id, name: $name, pageCount: $pageCount, description: $description, image: $image, rating: $rating, price: $price, isFavourite: $isFavourite, isPopular: $isPopular, author: $author)';
  }

  @override
  bool operator ==(covariant Book other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.pageCount == pageCount &&
        other.description == description &&
        other.image == image &&
        other.rating == rating &&
        other.price == price &&
        other.isFavourite == isFavourite &&
        other.isPopular == isPopular &&
        other.author == author;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        pageCount.hashCode ^
        description.hashCode ^
        image.hashCode ^
        rating.hashCode ^
        price.hashCode ^
        isFavourite.hashCode ^
        isPopular.hashCode ^
        author.hashCode;
  }
}

// Our demo Books

const String _description =
    "JavaScript lies at the heart of almost every modern web application, from social apps like Twitter to browser-based game frameworks like Phaser and Babylon. Though simple for beginners to pick up and play with, JavaScript is a flexible, complex language that you can use to build full-scale applications.";
