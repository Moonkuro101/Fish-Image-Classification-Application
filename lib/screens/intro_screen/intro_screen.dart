import 'package:fish_finder/screens/intro_screen/screen1.dart';
import 'package:fish_finder/screens/intro_screen/screen2.dart';
import 'package:fish_finder/screens/intro_screen/screen3.dart';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7eedd),
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: const [
              Screen1(),
              Screen2(),
              Screen3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Color(0xffF69461),
                    dotColor: Color(0xff3652AD)
                  ),
                  controller: pageController,
                  count: 3,
                  onDotClicked: (index) {
                    pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
