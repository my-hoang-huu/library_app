import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/bloc/base_bloc.dart';
import 'package:library_app/bloc/base_state.dart';
import 'package:library_app/data/models/base_modal.dart';
import 'package:library_app/data/repository/base_repository.dart';
import 'package:library_app/presentation/components/custom_bottom_nav_bar.dart';
import 'package:library_app/const_enum/enums.dart';

abstract class MainPageLayout extends StatefulWidget {
  const MainPageLayout({super.key});

  @override
  MainPageLayoutState createState();
}

abstract class MainPageLayoutState<T extends MainPageLayout, M extends BaseModal,
    R extends BaseRepository<M>> extends State<T> {
  EdgeInsets get getPagePadding => const EdgeInsets.symmetric(horizontal: 10, vertical: 10);

  bool _buildWhen(BaseState previous, BaseState current) =>
      current.type == screenType &&
      current is! SendingState &&
      !(current is SubmitSuccessState && current.preventRebuild);

  bool _listenWhen(BaseState previous, BaseState current) => current.type == screenType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: !hasAppbar
          ? null
          : AppBar(
              foregroundColor: Colors.black,
              backgroundColor: Theme.of(context).canvasColor,
              centerTitle: true,
              title: Text(
                getTitle,
              ),
              automaticallyImplyLeading: false),
      body: BlocConsumer<BaseBloc<M, R>, BaseState>(
        buildWhen: _buildWhen,
        listenWhen: _listenWhen,
        listener: (context, state) {},
        builder: (context, state) {
          return pageContent();
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: getTab),
    );
  }

  Color? get backgroundColor => null;

  Widget pageContent();

  String get getTitle;

  MainMenu get getTab;

  bool get hasAppbar;

  ModalType get screenType;
}
