import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          width: double.infinity,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationX(
                3.14), // Flip upside down and then flip left to right
            child: Opacity(
              opacity: 0.7,
              child: Image.asset(
                'assets/images/intro/surface.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Center(
          child: SizedBox(
            width: 290, // New width (larger size)
            height: 262, // New height (larger size)
            child: Image.asset(
              'assets/images/intro/fish.png',
              fit: BoxFit
                  .contain, // Maintain aspect ratio and fit within the size
            ),
          ),
        ),
        const SizedBox(
          height: 68,
        ),
        Center(
          child: Text(
            'การระบุปลาที่ง่ายและ\nรวดเร็ว! เพียงแค่จับภาพ',
            style: GoogleFonts.notoSansThai(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: const Color(0xff3652AD)),
            textAlign: TextAlign.center,
          ),
        ),
        Center(
          child: Text(
            ' แอพจะจำแนกประเภทของปลาทันทีและ\nช่วยให้คุณทราบข้อมูลในทันที',
            style: GoogleFonts.notoSansThai(
              fontWeight: FontWeight.normal,
              fontSize: 20,
              color: const Color(0xff280274),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
