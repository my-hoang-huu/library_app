import 'package:flutter/widgets.dart';
import 'package:library_app/presentation/screens/book/book_screen.dart';
import 'package:library_app/presentation/screens/cart/cart_screen.dart';
import 'package:library_app/presentation/screens/complete_profile/complete_profile_screen.dart';
import 'package:library_app/presentation/screens/book_details/book_details_screen.dart';
import 'package:library_app/presentation/screens/home/home_screen.dart';
import 'package:library_app/presentation/screens/profile/profile_screen.dart';
import 'presentation/screens/forgot_password/forgot_password_screen.dart';
import 'presentation/screens/login_success/login_success_screen.dart';
import 'presentation/screens/otp/otp_screen.dart';
import 'presentation/screens/reader/reader_screen.dart';
import 'presentation/screens/sign_in/sign_in_screen.dart';
import 'presentation/screens/sign_up/sign_up_screen.dart';
import 'presentation/screens/splash/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  BookScreen.routeName: (context) => BookScreen(),
  ReaderScreen.routeName: (context) => ReaderScreen(),
  BookDetailsScreen.routeName: (context) => BookDetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
