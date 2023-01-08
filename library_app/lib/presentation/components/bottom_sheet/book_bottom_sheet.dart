import 'package:flutter/material.dart';
import 'package:library_app/presentation/components/text_form_field_custom.dart';

import 'bottom_sheet_layout.dart';

class BookBottomSheet extends BottomSheetLayout {
  final String title;
  final String buttonTitle;
  const BookBottomSheet({
    super.key,
    required this.title,
    required this.buttonTitle,
  });

  @override
  _FilterCommissionBottomSheetState createState() => _FilterCommissionBottomSheetState();
}

class _FilterCommissionBottomSheetState extends BottomSheetLayoutState<BookBottomSheet> {
  bool get hasNationsDropdown => true;

  @override
  List<Widget> body(BuildContext context) {
    return [
      TextFormFieldCustom.text(
        hintText: "Title",
      ),
      mainSpace,
      TextFormFieldCustom.text(
        hintText: "Description",
      ),
      mainSpace,
      TextFormFieldCustom.text(
        hintText: "Page count",
        keyboardType: TextInputType.number,
      ),
      mainSpace,
      TextFormFieldCustom.text(
        hintText: "Author name",
      )
    ];
  }

  @override
  String get title => widget.title;

  @override
  String get buttonTitle => widget.buttonTitle;
}
