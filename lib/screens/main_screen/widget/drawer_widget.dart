import 'dart:ui';

import 'package:fish_finder/material/font_and_color.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.greenAccent, // Change to your desired color
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 200,
            child: DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/drawer/sea.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    mainColor.withOpacity(0.5),
                    BlendMode.lighten,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0), // Adjust padding as needed
                    child: CircleAvatar(
                      radius: 40, // Adjust the size of CircleAvatar
                      backgroundImage: AssetImage(
                          'assets/images/drawer/profile.png'), // Replace with your profile image
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'John Doe',
                    style: fontEnglish.copyWith(
                      color: const Color(0xff201658),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      shadows: [
                        Shadow(
                          color: mainColor, // Choose the color of the shadow
                          blurRadius:
                              5, // Adjust the blur radius for the shadow effect
                          offset: Offset(6,
                              2.0), // Set the horizontal and vertical offset for the shadow
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'johndoe@example.com',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Update the state of the app.
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app.
            },
          ),
        ],
      ),
    );
  }
}
