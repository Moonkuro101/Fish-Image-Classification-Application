import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fish_finder/screens/main_screen/menu_screen.dart';
import 'firebase_options.dart';
import 'package:fish_finder/screens/intro_screen/intro_screen.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      // home: LoginScreen(),
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),builder: (context, snapshot) {
        if (snapshot.hasData){
          return const MenuScreen();
        }
        return const IntroScreen();
      } ,),
    );
  }
}
