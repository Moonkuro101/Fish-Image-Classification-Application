import 'package:fish_finder/screens/intro_screen/screen1.dart';
import 'package:fish_finder/screens/intro_screen/screen2.dart';
import 'package:fish_finder/screens/intro_screen/screen3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    backgroundColor: const Color(0xfff7eedd),
    body: Stack(
      children: [
        PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              isLastPage = (index == 2);
              buttonText = isLastPage ? 'Get Started' : 'Next';
            });
          },
          children: const [
            Screen1(),
            Screen2(),
            Screen3(),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: SmoothPageIndicator(
                effect: const JumpingDotEffect(
                  activeDotColor: Color(0xffF69461),
                  dotColor: Color(0xff3652AD),
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
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 60.0,left: 30,right: 30), // Adjust this padding as necessary
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  !isLastPage
                      ? TextButton(
                          onPressed: () {
                            pageController.jumpToPage(2);
                            // Add your skip logic here
                          },
                          child: Text(
                            'Skip',
                            style: GoogleFonts.openSans(
                              color: const Color(0xff3652AD),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        )
                      : const SizedBox(width: 60,),
                  TextButton(
                    onPressed: () {
                      if (pageController.page == 2) {
                        // Handle "Get Started" logic here
                      } else {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    style: TextButton.styleFrom(
                      minimumSize: const Size(100, 40), // Set a minimum width and height
                    ),
                    child: Text(
                      buttonText,
                      style: GoogleFonts.openSans(
                        color: const Color(0xff3652AD),
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
      ],
    ),
  );
}

}
