import 'package:flutter/material.dart';
import 'package:library_app/presentation/components/custom_bottom_nav_bar.dart';
import 'package:library_app/const_enum/enums.dart';
import 'package:library_app/presentation/screens/page_layout.dart';

import 'components/body.dart';

class HomeScreen extends MainPageLayout {
  static String routeName = "/home";

  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends MainPageLayoutState<HomeScreen> {
  @override
  Widget pageContent() {
    return Body();
  }

  @override
  MenuState get getTab => MenuState.home;

  @override
  String get getTitle => throw UnimplementedError();

  @override
  bool get hasAppbar => false;
}
