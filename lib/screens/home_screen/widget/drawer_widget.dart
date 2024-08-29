import 'package:firebase_auth/firebase_auth.dart';
import 'package:fish_finder/material/font_and_color.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    

    return Drawer(
      backgroundColor: Colors.greenAccent, // Change to your desired color
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 250,
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
                  const Padding(
                    padding:
                        EdgeInsets.only(top: 20.0), // Adjust padding as needed
                    child: CircleAvatar(
                      radius: 50, // Adjust the size of CircleAvatar
                      backgroundImage: NetworkImage(
                          deafualtImageUrl), // Replace with your profile image
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'UserName',
                    style: fontEnglish.copyWith(
                      color: const Color(0xff201658),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      shadows: [
                        Shadow(
                          color: colorOrange, // Choose the color of the shadow
                          blurRadius:
                              2, // Adjust the blur radius for the shadow effect
                          offset: const Offset(1,
                              2.0), // Set the horizontal and vertical offset for the shadow
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    user != null ? user.email! : '',
                    style: fontEnglish.copyWith(
                      color: const Color(0xff201658),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      shadows: [
                        Shadow(
                          color: colorOrange, // Choose the color of the shadow
                          blurRadius:
                              2, // Adjust the blur radius for the shadow effect
                          offset: const Offset(1,
                              2.0), // Set the horizontal and vertical offset for the shadow
                        ),
                      ],
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
