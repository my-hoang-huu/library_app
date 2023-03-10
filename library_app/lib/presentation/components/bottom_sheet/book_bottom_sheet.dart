import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/bloc/base_even.dart';
import 'package:library_app/bloc/base_list_bloc.dart';
import 'package:library_app/data/repository/base_list_repository.dart';
import 'package:library_app/helper/validator.dart';
import 'package:library_app/presentation/components/text_form_field_custom.dart';

import '../../../data/models/book.dart';
import 'bottom_sheet_layout.dart';

class BookBottomSheet extends BottomSheetLayout {
  final String title;
  final String buttonTitle;
  final Book? currentBook;
  const BookBottomSheet({
    super.key,
    required this.title,
    required this.buttonTitle,
    this.currentBook,
  });

  @override
  _BookBottomSheetState createState() => _BookBottomSheetState();
}

class _BookBottomSheetState extends BottomSheetLayoutState<BookBottomSheet> {
  bool get hasNationsDropdown => true;

  Book? get _initBook => widget.currentBook;

  @override
  String get title => widget.title;

  @override
  String get buttonTitle => widget.buttonTitle;

  late final TextEditingController _titleController;
  late final TextEditingController _desController;
  late final TextEditingController _pageCountController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: _initBook?.name);
    _desController = TextEditingController(text: _initBook?.description);
    _pageCountController = TextEditingController(text: _initBook?.pageCount.toString());
  }

  @override
  void dispose() {
    _titleController.dispose();
    _desController.dispose();
    _pageCountController.dispose();
    super.dispose();
  }

  @override
  List<Widget> body(BuildContext context) {
    return [
      TextFormFieldCustom.text(
        hintText: "Title",
        controller: _titleController,
        validators: [Validators.required()],
      ),
      mainSpace,
      TextFormFieldCustom.text(
        hintText: "Description",
        controller: _desController,
      ),
      mainSpace,
      TextFormFieldCustom.text(
        hintText: "Page count",
        controller: _pageCountController,
        keyboardType: TextInputType.number,
      ),
      // mainSpace,
      // TextFormFieldCustom.text(
      //   hintText: "Author name",
      // )
    ];
  }

  @override
  void onSubmit(BuildContext context) {
    var isUpdate = _initBook != null;

    final newBook = Book(
        id: isUpdate ? _initBook!.id : 0,
        name: _titleController.text,
        description: _desController.text,
        pageCount: int.tryParse(_pageCountController.text));
    context
        .read<BaseListBloc<Book, BookListRepository>>()
        .add(SubmittedEvent(newBook, submitType: isUpdate ? SubmitType.update : SubmitType.create));

    Navigator.pop(context);
  }
}
