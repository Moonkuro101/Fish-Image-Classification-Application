import 'package:fish_finder/screens/login_and_create/components/background.dart';
import 'package:fish_finder/screens/login_and_create/components/footer_widget.dart';
import 'package:fish_finder/screens/login_and_create/components/from_widget.dart';
import 'package:fish_finder/screens/login_and_create/components/header_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLogin = true;
    return Background(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Header(isLogin: isLogin),
              BodyForm(isLogin: isLogin),
              FooterWidget(isLogin: isLogin),
            ],
          ),
        ),
      ),
    );
  }
}
