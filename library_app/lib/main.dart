import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/bloc/base_even.dart';
import 'package:library_app/data/models/reader.dart';
import 'package:library_app/routes.dart';
import 'package:library_app/theme_size/theme.dart';

import 'bloc/base_list_bloc.dart';
import 'bloc/base_state.dart';
import 'data/models/book.dart';
import 'data/repository/base_list_repository.dart';
import 'firebase_options.dart';
import 'presentation/screens/sign_in/sign_in_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => BookListRepository(),
        ),
        RepositoryProvider(
          create: (context) => ReaderListRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BaseListBloc<Book, BookListRepository>(
                repository: context.read<BookListRepository>(), type: ModalType.book)
              ..add(const StartedEvent()),
          ),
          BlocProvider(
            create: (context) => BaseListBloc<Book, BookListRepository>(
                repository: context.read<BookListRepository>(), type: ModalType.bookList)
              ..add(const StartedEvent()),
          ),
          BlocProvider(
            create: (context) => BaseListBloc<Reader, ReaderListRepository>(
                repository: context.read<ReaderListRepository>(), type: ModalType.reader)
              ..add(const StartedEvent()),
          ),
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
