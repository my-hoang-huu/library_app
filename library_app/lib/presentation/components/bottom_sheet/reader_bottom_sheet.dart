import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/bloc/base_even.dart';
import 'package:library_app/bloc/base_list_bloc.dart';
import 'package:library_app/data/repository/base_list_repository.dart';
import 'package:library_app/helper/validator.dart';
import 'package:library_app/presentation/components/text_form_field_custom.dart';

import '../../../data/models/reader.dart';
import 'bottom_sheet_layout.dart';

class ReaderBottomSheet extends BottomSheetLayout {
  final String title;
  final String buttonTitle;
  final Reader? currentReader;
  const ReaderBottomSheet({
    super.key,
    super.onDelete,
    required this.title,
    required this.buttonTitle,
    this.currentReader,
  });

  @override
  _ReaderBottomSheetState createState() => _ReaderBottomSheetState();
}

class _ReaderBottomSheetState extends BottomSheetLayoutState<ReaderBottomSheet> {
  bool get hasNationsDropdown => true;

  Reader? get _initReader => widget.currentReader;

  @override
  String get title => widget.title;

  @override
  String get buttonTitle => widget.buttonTitle;

  late final TextEditingController _nameController;
  late final TextEditingController _studentCodeController;
  late final TextEditingController _universityController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: _initReader?.name);
    _studentCodeController = TextEditingController(text: _initReader?.studentCode);
    _universityController = TextEditingController(text: _initReader?.university);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _studentCodeController.dispose();
    _universityController.dispose();
    super.dispose();
  }

  @override
  List<Widget> body(BuildContext context) {
    return [
      TextFormFieldCustom.text(
        hintText: "Name",
        controller: _nameController,
        validators: [Validators.required()],
      ),
      mainSpace,
      TextFormFieldCustom.text(
        hintText: "Student code",
        controller: _studentCodeController,
        keyboardType: TextInputType.number,
      ),
      mainSpace,
      TextFormFieldCustom.text(
        hintText: "University",
        controller: _universityController,
      ),
      // mainSpace,
      // TextFormFieldCustom.text(
      //   hintText: "Author name",
      // )
    ];
  }

  @override
  void onSubmit(BuildContext context) {
    var isUpdate = _initReader != null;

    final newReader = Reader(
        id: isUpdate ? _initReader!.id : 0,
        name: _nameController.text,
        studentCode: _studentCodeController.text,
        university: _universityController.text);
    context.read<BaseListBloc<Reader, ReaderListRepository>>().add(
        SubmittedEvent(newReader, submitType: isUpdate ? SubmitType.update : SubmitType.create));

    Navigator.pop(context);
  }
}
