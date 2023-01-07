import 'package:flutter/material.dart';

import 'base_modal.dart';

class Book extends BaseModal {
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
    "JavaScript lies at the heart of almost every modern web application, from social apps like Twitter to browser-based game frameworks like Phaser and Babylon. Though simple for beginners to pick up and play with, JavaScript is a flexible, complex language that you can use to build full-scale applications.";
