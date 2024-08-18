import 'package:fish_finder/screens/intro_screen/intro_screen.dart';
import 'package:fish_finder/screens/login_and_create/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(
    0xfff7eedd,
  ),
);

final theme = ThemeData(
  useMaterial3: true,
  textTheme: GoogleFonts.interTextTheme().copyWith(
    titleLarge: GoogleFonts.inter(
      fontWeight: FontWeight.bold,
    ),
  ),
);

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home:  IntroScreen(),
    );
  }
}
