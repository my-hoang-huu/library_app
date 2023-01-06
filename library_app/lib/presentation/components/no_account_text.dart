import 'package:flutter/material.dart';
import 'package:library_app/presentation/screens/sign_up/sign_up_screen.dart';

import '../../const_enum/constants.dart';
import '../../theme_size/size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
            "Sign Up",
            style: TextStyle(fontSize: getProportionateScreenWidth(16), color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
