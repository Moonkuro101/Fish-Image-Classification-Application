import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    super.key,
    required this.child,
    this.topImage = "assets/background_image/main_top.png",
    this.bottomImage = "assets/background_image/login_bottom.png",
  });

  final String topImage, bottomImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7eedd),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                topImage,
                width: 120,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                bottomImage,
                width: 120,

              ),
            ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}