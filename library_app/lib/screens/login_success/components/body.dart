import 'package:flutter/material.dart';
import 'package:library_app/components/default_button.dart';
import 'package:library_app/screens/home/home_screen.dart';
import 'package:library_app/theme_size/size_config.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () => Navigator.pushNamed(context, HomeScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: SizedBox(
            child: DefaultButton(
              text: "Back to home",
              press: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
