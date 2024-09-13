import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isFadedOut = true;

  @override
  void initState() {
    super.initState();
    _startFadeOut();
  }

  Future<void> _startFadeOut() async {
    // Wait for a short duration before starting the fade-out effect
    await Future.delayed(const Duration(milliseconds: 200));
    if (mounted) {
      setState(() {
        _isFadedOut = false;
      });
    }
    // The fade-out duration is 1 second
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7eedd),
      body: Center(
        child: AnimatedOpacity(
          opacity: _isFadedOut ? 0.0 : 1.0,
          duration: const Duration(seconds: 1),
          child: Image.asset(
            'assets/icon/icon.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
