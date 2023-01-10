import 'package:flutter/material.dart';
import 'package:library_app/bloc/base_state.dart';
import 'package:library_app/const_enum/enums.dart';
import 'package:library_app/data/models/reader.dart';
import 'package:library_app/presentation/components/bottom_sheet/bottom_sheet_layout.dart';
import 'package:library_app/presentation/components/bottom_sheet/reader_bottom_sheet.dart';

import '../../../data/repository/base_list_repository.dart';
import '../page_layout.dart';
import 'reader_card.dart';

class ReaderScreen extends MainPageLayout {
  static String routeName = "/reader";

  const ReaderScreen({super.key});

  @override
  _ReaderScreenState createState() => _ReaderScreenState();
}

class _ReaderScreenState extends MainPageLayoutState<ReaderScreen, Reader, ReaderListRepository> {
  @override
  ListView pageContent(BuildContext context, List<Reader> info) {
    return ListView.builder(
      padding: getPagePadding,
      itemCount: info.length,
      itemBuilder: (context, index) {
        return ReaderCard(
          context: context,
          reader: info[index],
        );
      },
    );
  }

  @override
  MainMenu get getTab => MainMenu.reader;

  @override
  String get getTitle => "Reader";

  @override
  bool get hasAppbar => true;

  @override
  Color? get backgroundColor => Colors.grey.shade100;

  @override
  ModalType get screenType => ModalType.reader;

  @override
  bool get hasBottomNavigationBar => true;

  @override
  void onCreate(BuildContext context) {
    showCustomBottomSheet(
        context: context,
        bottomSheetWidget: const ReaderBottomSheet(
          title: "Create Reader",
          buttonTitle: "Add",
        ));
  }
}
