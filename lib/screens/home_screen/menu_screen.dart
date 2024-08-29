import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fish_finder/screens/home_screen/widget/carousel.dart';
import 'package:fish_finder/screens/home_screen/widget/fish_finder.dart';
import 'package:fish_finder/screens/home_screen/widget/menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator()); // Show loading indicator
        } else if (snapshot.hasError) {
          return const Center(
              child: Text('Error fetching username')); // Show error message
        }

        final userdata = snapshot.data!;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Hello',
                    style: GoogleFonts.inter(
                        color: const Color(0xff0A9CEB),
                        fontSize: 26,
                        fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: ',\n${userdata['username']}',
                        style: GoogleFonts.inter(
                          color: const Color(0xff062F45),
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: CarouselWidget(),
                ),
                const FishFinderContainer(),
                const SizedBox(
                  height: 20,
                ),
                const Menu(),
              ],
            ),
          ),
        );
      },
    );
  }
}
