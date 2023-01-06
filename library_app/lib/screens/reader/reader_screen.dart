import 'package:flutter/material.dart';
import 'package:library_app/components/custom_bottom_nav_bar.dart';
import 'package:library_app/const_enum/enums.dart';

class ReaderScreen extends StatelessWidget {
  static String routeName = "/reader";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Reader"),
      // ),
      body: Container(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.reader),
    );
  }
}
