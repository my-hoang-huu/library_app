import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:library_app/components/custom_bottom_nav_bar.dart';
import 'package:library_app/components/image_picker_button.dart';
import 'package:library_app/const/app_const.dart';
import 'package:library_app/enums.dart';

import 'components/body.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? imageFile;

  String result = "Chưa có thao tác";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Body(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ImagePickerButton(
            onImageTaken: (image) async {
              imageFile = image;
              // final reponseGetBook = await http.get(DataConst.getUrl("/book-management/books"));
              // print(reponseGetBook.body);
              result = await uploadImage(image);
              setState(() {});
            },
          ),
          SizedBox(
            height: 30,
          ),
          Text(result)
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}

Future<String> uploadImage(File imageFile) async {
  final request = http.MultipartRequest("POST", DataConst.getUrl("/image-management/image"));
  final headers = {"Content-type": "multipart/form-data"};
  final picture = http.MultipartFile(
      'image', imageFile.readAsBytes().asStream(), imageFile.lengthSync(),
      filename: imageFile.path.split("/").last);
  request.files.add(picture);

  request.headers.addAll(headers);

  try {
    final response = await request.send();
    final res = await http.Response.fromStream(response);
    print(["image response: ", res.body]);
    return jsonDecode(res.body)['message'];
  } catch (e) {
    print(["error:", e]);
  }
  return "Failse";
}

Future<String> testPost() async {
  try {
    http.Response response = await http.post(
      DataConst.getUrl("/book-management/book"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "author_id": "12",
        "category_id": "13244",
        "name": "ddasfsaf",
        "page_count": "123"
      }),
    );
    return response.body;
  } catch (e) {
    print(["test error: ", e]);
  }

  return "False";
}
