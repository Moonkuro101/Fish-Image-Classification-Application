import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fish_finder/material/font_and_color.dart';
import 'package:fish_finder/screens/login_and_create/login.dart';
import 'package:fish_finder/screens/tab_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:fish_finder/screens/intro_screen/intro_screen.dart';
import 'package:flutter/material.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(
    0xfff7eedd,
  ),
);

final theme = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedLabelStyle: fontEnglish.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 16.0,
      color: Colors.blue,
    ),
    unselectedLabelStyle: fontEnglish.copyWith(
      fontWeight: FontWeight.normal,
      fontSize: 14.0,
      color: Colors.grey,
    ),
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
  ),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Firebase initialization failed: $e');
  }
  // await addDummyFishes();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool hasSeenIntro = prefs.getBool('hasSeenIntro') ?? false;

  runApp(
    ProviderScope(
      child: Myapp(
        hasSeenIntro: hasSeenIntro,
      ),
    ),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({super.key, required this.hasSeenIntro});
  final bool hasSeenIntro;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      // home: LoginScreen(),
      home: hasSeenIntro
          ? const IntroScreen()
          : StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const TabsScreen();
                }
                return const LoginScreen();
              },
            ),
    );
  }
}
