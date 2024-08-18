import 'package:fish_finder/screens/login_and_create/login_widget/footer_widget.dart';
import 'package:fish_finder/screens/login_and_create/login_widget/from_widget.dart';
import 'package:fish_finder/screens/login_and_create/login_widget/header_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLogin = true;
    return Scaffold(
      backgroundColor: const Color(0xfff7eedd),
      body: SafeArea(
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
      ),
    );
  }
}
