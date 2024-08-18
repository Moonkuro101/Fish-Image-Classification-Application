import 'package:fish_finder/material/font_and_color.dart';
import 'package:flutter/material.dart';

class BodyForm extends StatefulWidget {
  const BodyForm({super.key, required this.isLogin});

  final bool isLogin;

  @override
  State<BodyForm> createState() => _BodyFormState();
}

class _BodyFormState extends State<BodyForm> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person_outline_outlined,
                  color: Colors.grey.withOpacity(1),
                ),
                filled: true,
                fillColor: Colors.white,
                labelText: 'Email',
                labelStyle: fontEnglish.copyWith(
                  color: const Color.fromRGBO(123, 134, 170, 100),
                  fontSize: 16,
                ),
                hintStyle: fontEnglish.copyWith(
                  color: const Color.fromRGBO(68, 83, 129, 0.612),
                  fontSize: 14,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.fingerprint,
                  color: Colors.grey.withOpacity(1),
                ),
                filled: true,
                fillColor: Colors.white,
                labelText: 'Password',
                labelStyle: fontEnglish.copyWith(
                  color: const Color.fromRGBO(123, 134, 170, 100),
                  fontSize: 16,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            if (widget.isLogin)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forget Password?',
                    style: fontEnglish.copyWith(
                      color: const Color(0xff0E7DFF),
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              )
              else const SizedBox(height: 50,),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: GestureDetector(
                onTapDown: (_) => setState(() => _isPressed = true),
                onTapUp: (_) => setState(() => _isPressed = false),
                onTapCancel: () => setState(() => _isPressed = false),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  transform:
                      Matrix4.translationValues(0, _isPressed ? 5 : 0, 0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, _isPressed ? 2 : 8),
                        blurRadius: _isPressed ? 6 : 12,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: loginButton,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(widget.isLogin?
                      'Login' : 'Create Account',
                      style: fontEnglish.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
