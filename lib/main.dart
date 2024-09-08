import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fish_finder/material/font_and_color.dart';
import 'package:fish_finder/screens/login_and_create/login.dart';
import 'package:fish_finder/screens/tab_screen.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
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