import 'package:fish_finder/material/font_and_color.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.isLogin});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SizedBox(
            width: 225,
            height: 250,
            child: Image.asset(
              isLogin
                  ? 'assets/images/login/login.png'
                  : 'assets/images/login/create.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        Text(isLogin ?
          'กรุณาลงชื่อเข้าใช้เพื่อดำเนินการต่อ' : 'สร้างบัญชีของคุณที่นี้',
          style: fontThai.copyWith(
            color: colorBlue,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
