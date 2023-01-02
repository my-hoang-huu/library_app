import 'package:flutter/material.dart';

import 'Book.dart';
import 'Book.dart';

class Cart {
  final Book book;
  final int numOfItem;

  Cart({required this.book, required this.numOfItem});
}

// Demo data for our cart

List<Cart> demoCarts = [
  Cart(book: demoBooks[0], numOfItem: 2),
  Cart(book: demoBooks[1], numOfItem: 1),
  Cart(book: demoBooks[3], numOfItem: 1),
];
