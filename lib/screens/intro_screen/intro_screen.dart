import 'package:fish_finder/material/font_and_color.dart';
import 'package:fish_finder/screens/intro_screen/screen1.dart';
import 'package:fish_finder/screens/intro_screen/screen2.dart';
import 'package:fish_finder/screens/intro_screen/screen3.dart';
import 'package:fish_finder/screens/login_and_create/login.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController pageController = PageController();
  String buttonText = 'Next'; // Initialize with 'Next'
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  isLastPage = (index == 2);
                  buttonText = isLastPage ? 'Done' : 'Next';
                });
              },
              children: const [
                Screen1(),
                Screen2(),
                Screen3(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                bottom: 30.0), // Adjust the padding as needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Skip Button with Visibility
                Visibility(
                  visible:
                      !isLastPage, // Toggle visibility based on the current page
                  maintainSize: true, // Maintain the size even when not visible
                  maintainAnimation: true,
                  maintainState: true,
                  child: TextButton(
                    onPressed: () {
                      pageController.jumpToPage(2); // Skip to the last page
                    },
                    child: Text(
                      'Skip',
                      style: fontEnglish.copyWith(
                        color: colorBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  effect:  JumpingDotEffect(
                    activeDotColor: colorOrange,
                    dotColor: colorBlue,
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
                TextButton(
                  onPressed: () {
                    if (pageController.page == 2) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return  LoginScreen();
                          },
                        ),
                      );
                      // Handle "Done" logic here
                    } else {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: colorBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),

                    // Set a minimum width and height
                  ),
                  child: Text(
                    buttonText,
                    style: fontEnglish.copyWith(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
