import 'dart:io';

import 'package:flutter/material.dart';
import 'package:library_app/components/custom_bottom_nav_bar.dart';
import 'package:library_app/components/image_picker_button.dart';
import 'package:library_app/enums.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Body(),
      body: Center(
        child: Center(
          child: ImagePickerButton(
            onImageTaken: (image) {
              imageFile = image;
              print(imageFile?.uri);
            },
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
