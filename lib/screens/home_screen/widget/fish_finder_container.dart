import 'package:fish_finder/material/font_and_color.dart';
import 'package:fish_finder/screens/FishFinder/hero_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FishFinderContainer extends StatelessWidget {
  const FishFinderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HeroScreen(),
          ),
        );
      },
      child: Container(
        height: 150,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black45, // Choose the color of the shadow
              blurRadius: 6,
              offset: Offset(1.0, 4.0),
            )
          ],
          gradient: const LinearGradient(
            colors: [Color(0xff52CFFA), Color(0xff52A9FA)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          // Background color
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FishFinder',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        const Shadow(
                          color:
                              Colors.black45, // Choose the color of the shadow
                          blurRadius:
                              6, // Adjust the blur radius for the shadow effect
                          offset: Offset(1,
                              4.0), // Set the horizontal and vertical offset for the shadow
                        )
                      ],
                    ),
                  ),
                  // Space between texts
                  Text(
                    'ตามหาปลาที่คุณ\nต้องการด้วยรูปภาพ',
                    style: fontThai.copyWith(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        const Shadow(
                          color:
                              Colors.black45, // Choose the color of the shadow
                          blurRadius: 6,
                          offset: Offset(1.0, 4.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Image Icon
            Image.asset(
              'assets/images/image_icon.png',
              fit: BoxFit.cover, // Replace with your image asset path
            ),
          ],
        ),
      ),
    );
  }
}
