import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fish_finder/provider/fetch_data_favorite_provider.dart';
import 'package:fish_finder/screens/fish_category_screen/fish_category.dart';
import 'package:fish_finder/screens/home_screen/menu_screen.dart';
import 'package:fish_finder/screens/home_screen/widget/drawer_widget.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _startListeningForFavorites();
  }

  void _startListeningForFavorites() {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    ref.read(fishProvider.notifier).fetchFavoriteFish(userId);
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final fishList = ref.watch(fishProvider);

    Widget activePage = const MenuScreen();
    var activePageTitle = 'Home';

    if (_selectedPageIndex == 1) {
      activePageTitle = 'Your Favorites Fish';
      activePage = FishListScreen(
        title: null,
        fishList: fishList, // Pass the list directly to your screen
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF0F5FF),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: AppBar(
              title: Text(activePageTitle),
              centerTitle: true,
              leading: Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                      icon: const Icon(Icons.menu, size: 30, color: Color.fromARGB(255, 4, 6, 10)),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  );
                },
              ),
              actions: [
                IconButton(
                  onPressed: () => FirebaseAuth.instance.signOut(),
                  icon: const Icon(Icons.exit_to_app, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        drawer: const DrawerWidget(),
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ],
        ),
      ),
    );
  }
}
