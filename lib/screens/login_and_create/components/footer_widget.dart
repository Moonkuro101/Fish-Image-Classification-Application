import 'package:fish_finder/material/font_and_color.dart';
import 'package:fish_finder/screens/login_and_create/create_account.dart';
import 'package:fish_finder/screens/login_and_create/login.dart';
import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key, required this.isLogin});
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          const Text("OR"),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(width: 1.0, color: Colors.grey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              icon: Image.asset(
                'assets/images/login/google.png',
                width: 20,
                height: 20,
              ),
              label: Text(
                'Sign-in with Google',
                style: fontEnglish.copyWith(
                  color: const Color(0xff727272),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              isLogin
                  ? Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CreateAccount(),
                      ),
                    )
                  : Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
            },
            child: Text.rich(
              TextSpan(
                text: isLogin ? 'ไม่มีบัญชี?' : 'มีบัญชีอยู่แล้ว?',
                style: fontThai.copyWith(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: isLogin ? ' สมัครเลยคลิก' : ' ลงชื่อเข้าใช้',
                    style: fontThai.copyWith(
                      color: colorBlue,
                    ),
                  )
                ],
              ),
              style: fontThai.copyWith(),
            ),
          ),
        ],
      ),
    );
  }
}
