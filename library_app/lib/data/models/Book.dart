import 'package:flutter/material.dart';

class Book {
  final int id;
  final String name, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;
  final bool pageCount;
  final String? author;

  Book({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.name,
    required this.price,
    required this.description,
    required this.pageCount,
    this.author,
  });
}

// Our demo Books

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
