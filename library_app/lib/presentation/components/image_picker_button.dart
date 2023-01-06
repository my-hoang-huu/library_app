// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:library_app/presentation/components/default_button.dart';

enum _PickImageAction { camera, library, cancel }

extension _PickImageActionEx on _PickImageAction {
  String getTitle(BuildContext context) {
    switch (this) {
      case _PickImageAction.camera:
        return 'Take a photo';
      case _PickImageAction.library:
        return 'Gallery';
      case _PickImageAction.cancel:
        return 'Cancel';
    }
  }

  ImageSource get getSource {
    switch (this) {
      case _PickImageAction.camera:
        return ImageSource.camera;
      case _PickImageAction.library:
        return ImageSource.gallery;
      case _PickImageAction.cancel:
        return ImageSource.camera;
    }
  }
}

class ImagePickerButton extends StatefulWidget {
  final void Function(File image) onImageTaken;
  const ImagePickerButton({
    super.key,
    required this.onImageTaken,
  });

  @override
  State<ImagePickerButton> createState() => _ImagePickerButtonState();
}

class _ImagePickerButtonState extends State<ImagePickerButton> {
  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      text: "Pick image",
      press: () async {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.zero,
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(children: [
                      _selectPickImgMethod(_PickImageAction.camera),
                      Divider(
                        thickness: .25,
                        endIndent: 12,
                        indent: 12,
                        height: 0,
                        color: Theme.of(context).dividerColor,
                      ),
                      _selectPickImgMethod(_PickImageAction.library),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  _selectPickImgMethod(_PickImageAction.cancel),
                  const SizedBox(height: 32),
                ]),
              ),
            );
          },
        );
      },
    );
  }

  Widget _selectPickImgMethod(_PickImageAction action) {
    return InkWell(
      onTap: () async {
        if (action == _PickImageAction.cancel) return Navigator.pop(context);
        final imagePicker = await ImagePicker().pickImage(source: action.getSource);
        Navigator.pop(context);
        if (imagePicker == null) return;
        widget.onImageTaken(File(imagePicker.path));
      },
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor, borderRadius: BorderRadius.circular(12)),
        child: Text(
          action.getTitle(context),
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.normal, color: Colors.black),
        ),
      ),
    );
  }
}
