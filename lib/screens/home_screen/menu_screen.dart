import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fish_finder/screens/home_screen/widget/carousel.dart';
import 'package:fish_finder/screens/home_screen/widget/fish_finder_container.dart';
import 'package:fish_finder/screens/home_screen/widget/menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    
    if (user == null) {
      // Handle the case where the user is not logged in
      return const Center(child: Text('User not logged in'));
    }

    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error fetching username'));
        }

        final userdata = snapshot.data!;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.lightBlue.shade200,
                      Colors.white,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Hello',
                          style: GoogleFonts.inter(
                              color: const Color.fromARGB(255, 47, 110, 139),
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
                      // Replace Expanded with SizedBox or Container
                      const SizedBox(
                        height: 150, // Set an appropriate height
                        child: FishFinderContainer(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Menu(),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
