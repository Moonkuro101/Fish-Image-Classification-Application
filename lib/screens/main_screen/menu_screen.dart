import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fish_finder/material/font_and_color.dart';
import 'package:fish_finder/screens/main_screen/widget/drawer_widget.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: AppBar(
              backgroundColor: mainColor,
              elevation: 1,
              centerTitle: true,
              leading: Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                      icon: const Icon(Icons.menu, size: 30,color: Color.fromARGB(255, 4, 6, 10)), // Change color here
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  );
                },
              ),
              actions: [
                IconButton(
                  onPressed: FirebaseAuth.instance.signOut,
                  icon: const Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: const DrawerWidget(),
        body: const Center(
          child: Text('Menu Screen'),
        ),
      ),
    );
  }
}
