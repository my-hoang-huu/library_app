import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/bloc/base_list_bloc.dart';
import 'package:library_app/bloc/base_state.dart';
import 'package:library_app/const_enum/enums.dart';
import 'package:library_app/data/models/base_modal.dart';
import 'package:library_app/data/repository/base_list_repository.dart';
import 'package:library_app/presentation/components/custom_bottom_nav_bar.dart';
import 'package:library_app/widget/loader_dialog.dart';
import 'package:library_app/widget/success_dialog.dart';

abstract class MainPageLayout extends StatefulWidget {
  const MainPageLayout({super.key});

  @override
  MainPageLayoutState createState();
}

abstract class MainPageLayoutState<T extends MainPageLayout, M extends BaseModal,
    R extends BaseListRepository<M>> extends State<T> {
  EdgeInsets get getPagePadding => const EdgeInsets.symmetric(horizontal: 10, vertical: 10);

  bool buildWhen(BaseState previous, BaseState current) =>
      current.type == screenType &&
      current is! SendingState &&
      !(current is SubmitSuccessState && current.preventRebuild);

  bool _listenWhen(BaseState previous, BaseState current) => current.type == screenType;

  bool _isLoaderDialogDisplaying = false;

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
      body: BlocConsumer<BaseListBloc<M, R>, BaseState>(
        buildWhen: buildWhen,
        listenWhen: _listenWhen,
        listener: (context, state) {
          if (_isLoaderDialogDisplaying) _hideLoaderDialog(context);
          if (state is SendingState) {
            _isLoaderDialogDisplaying = true;
            showLoaderDialog(context);
          }
          if (state is SubmitListSuccessState) {
            showDialog(
              context: context,
              builder: (BuildContext context) =>
                  SuccessDialog(message: state.successMessage ?? "Update successfully!"),
            );
          }
        },
        builder: (context, state) {
          print(["bloc state", state]);
          if (state is LoadingState) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (state is LoadedListState<M>) {
            return pageContent(context, state.info);
          }
          if (state is SubmitListSuccessState<M>) {
            return pageContent(context, state.newInfo);
          }
          if (state is ErrorState) {
            return Center(child: Text(" Error happened ${state.error.toString()}"));
          }
          return Center(child: CupertinoActivityIndicator());
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: getTab),
    );
  }

  Color? get backgroundColor => null;

  Widget pageContent(BuildContext context, List<M> info);

  String get getTitle;

  MainMenu get getTab;

  bool get hasAppbar;

  ModalType get screenType;

  void _hideLoaderDialog(BuildContext context) {
    Navigator.pop(context);
    _isLoaderDialogDisplaying = false;
  }
}
