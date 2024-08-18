import 'package:fish_finder/material/font_and_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          width: double.infinity,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationX(3.14) *
                Matrix4.rotationY(
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
            width: 308, // New width (larger size)
            height: 284, // New height (larger size)
            child: Image.asset(
              'assets/images/intro/fisherman.png',
              fit: BoxFit
                  .contain, // Maintain aspect ratio and fit within the size
            ),
          ),
        ),
        const SizedBox(
          height: 46,
        ),
        Center(
          child: Text(
            'เข้าร่วมชุมชนนักตกปลา!\nแบ่งปันการจับของคุณ',
            style: fontThai.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: const Color(0xff3652AD)),
            textAlign: TextAlign.center,
          ),
        ),
        Center(
          child: Text(
            'รับคำแนะนำจากผู้อื่น\nและมีส่วนร่วมในการท้าทาย',
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
