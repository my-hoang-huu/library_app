import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/bloc/base_bloc.dart';
import 'package:library_app/bloc/base_even.dart';
import 'package:library_app/data/models/list_book.dart';
import 'package:library_app/data/repository/base_list_repository.dart';
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
  _FilterCommissionBottomSheetState createState() => _FilterCommissionBottomSheetState();
}

class _FilterCommissionBottomSheetState extends BottomSheetLayoutState<BookBottomSheet> {
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
  List<Widget> body(BuildContext context) {
    return [
      TextFormFieldCustom.text(
        hintText: "Title",
        controller: _titleController,
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
  onSubmit(BuildContext context) {
    print("text");
    if (_initBook != null) {
      final newBook = Book(
          id: _initBook!.id,
          name: _titleController.text,
          description: _desController.text,
          pageCount: int.tryParse(_pageCountController.text));
      context.read<BaseBloc<BookList, BookListRepository>>().add(SubmittedBookEvent(newBook));
    } else {}
  }
}
