import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:library_app/screens/book/book_screen.dart';
import 'package:library_app/screens/home/home_screen.dart';
import 'package:library_app/screens/profile/profile_screen.dart';
import 'package:library_app/screens/reader/reader_screen.dart';

import '../const_enum/constants.dart';
import '../const_enum/enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  color: MenuState.home == selectedMenu ? kPrimaryColor : inActiveIconColor,
                ),
                onPressed: () => Navigator.pushNamed(context, HomeScreen.routeName),
              ),
              IconButton(
                iconSize: 26,
                icon: Icon(CupertinoIcons.book,
                    color: MenuState.book == selectedMenu ? kPrimaryColor : inActiveIconColor),
                onPressed: () => Navigator.pushNamed(context, BookScreen.routeName),
              ),
              IconButton(
                iconSize: 38,
                icon: Icon(CupertinoIcons.group,
                    color: MenuState.reader == selectedMenu ? kPrimaryColor : inActiveIconColor),
                onPressed: () => Navigator.pushNamed(context, ReaderScreen.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: MenuState.profile == selectedMenu ? kPrimaryColor : inActiveIconColor,
                ),
                onPressed: () => Navigator.pushNamed(context, ProfileScreen.routeName),
              ),
            ],
          )),
    );
  }
}
