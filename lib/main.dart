// main.dart
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fish_finder/material/font_and_color.dart';
import 'package:fish_finder/screens/login_and_create/login.dart';
import 'package:fish_finder/screens/splash_screen.dart';
import 'package:fish_finder/screens/tab_screen.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xfff7eedd),
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
      home: const SplashScreenWrapper(),
    );
  }
}

class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({super.key});

  @override
  State<SplashScreenWrapper> createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  late Future<void> _initialization;

  @override
  void initState() {
    super.initState();
    _initialization = _initialize();
  }

  Future<void> _initialize() async {
    await Future.delayed(const Duration(seconds: 2)); // Ensure splash screen is shown for 2 seconds
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show the splash screen
          return const SplashScreen();
        } else {
          // Check the authentication state
          return StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
 
              if (snapshot.hasData) {
                // User is authenticated
                return const TabsScreen();
              } else {
                // User is not authenticated
                return const LoginScreen();
              }
            },
          );
        }
      },
    );
  }
}
