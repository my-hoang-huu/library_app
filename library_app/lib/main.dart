import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/routes.dart';
import 'package:library_app/theme_size/theme.dart';

import 'bloc/base_bloc.dart';
import 'bloc/base_state.dart';
import 'data/models/book.dart';
import 'data/repository/base_repository.dart';
import 'presentation/screens/sign_in/sign_in_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => BookRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BaseBloc<Book, BookRepository>(
                repository: context.read<BookRepository>(), type: ModalType.book),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: theme(),
          // home: SplashScreen(),
          // We use routeName so that we dont need to remember the name
          initialRoute: SignInScreen.routeName,
          routes: routes,
        ),
      ),
    );
  }
}
