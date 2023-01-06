import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:library_app/presentation/components/custom_bottom_nav_bar.dart';
import 'package:library_app/presentation/components/default_button.dart';
import 'package:library_app/presentation/components/image_picker_button.dart';
import 'package:library_app/const_enum/app_const.dart';
import 'package:library_app/const_enum/enums.dart';

class HomeScreenTest extends StatefulWidget {
  static String routeName = "/home";

  const HomeScreenTest({super.key});

  @override
  State<HomeScreenTest> createState() => _HomeScreenTestState();
}

class _HomeScreenTestState extends State<HomeScreenTest> {
  Image? imageFileTest;

  String result = "Chưa có thao tác";

  String? _base64;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Body(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ImagePickerButton(
            onImageTaken: (image) async {
              result = await uploadBook(image);
            },
          ),
          SizedBox(
            height: 30,
          ),
          DefaultButton(
            text: "load image",
            press: () async {
              try {
                final reponse = await http.get(DataConst.getUrl("/book-management/book/3"),
                    headers: DataConst.httpHeaders);
                final imageContent = jsonDecode(reponse.body)['image'];
                imageFileTest = imageFromBase64String(imageContent);
              } catch (e) {
                print(e);
              }
              setState(() {});
            },
          ),
          Container(
            height: 300,
            width: 300,
            color: Colors.amber,
            child: imageFileTest,
          ),
          Text(result),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }

  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  String base64String(Uint8List data) {
    return base64Encode(data);
  }

  Future<String> uploadBook(File imageFile) async {
    try {
      Uint8List imagebytes = await imageFile.readAsBytes(); //convert to bytes
      String base64string = base64.encode(imagebytes); //convert bytes to base64 string
      print(['base64string', base64string]);
      testPost(base64string);
    } catch (e) {
      return e.toString();
    }

    return 'success';
  }
}

Future<String> uploadImageToCreateUrl(File imageFile) async {
  final request = http.MultipartRequest("POST", DataConst.getUrl("/image-management/image"));
  final headers = {"Content-type": "multipart/form-data"};
  final picture = http.MultipartFile(
      'image', imageFile.readAsBytes().asStream(), imageFile.lengthSync(),
      filename: imageFile.path.split("/").last);

  request.files.add(picture);
  request.headers.addAll(headers);
  print("request: " + request.toString());

  try {
    final response = await request.send();
    final res = await http.Response.fromStream(response);
    print(["image response: ", res.body]);
    return "Success";
  } catch (e) {
    print(["error:", e]);
  }
  return "Failse";
}

Future<String> testPost(String base64string) async {
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
        "page_count": "123",
        "image": base64string
      }),
    );
    return response.body;
  } catch (e) {
    print(["test error: ", e]);
  }

  return "False";
}
