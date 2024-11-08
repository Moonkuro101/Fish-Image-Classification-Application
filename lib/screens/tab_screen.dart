import 'package:firebase_auth/firebase_auth.dart';
import 'package:fish_finder/screens/history_screen/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fish_finder/provider/fetch_data_favorite_provider.dart';
import 'package:fish_finder/screens/fish_category_screen/fish_list.dart';
import 'package:fish_finder/screens/home_screen/menu_screen.dart';

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

    if (_selectedPageIndex == 2) {
      activePageTitle = 'Your History';
      activePage = const HistoryScreen();
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue.shade200,
          title: Text(activePageTitle,
              style: const TextStyle(
                  color: Color.fromARGB(255, 15, 54, 71),
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          
          actions: [
            IconButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              icon: const Icon(Icons.exit_to_app, color: Colors.white),
            ),
          ],
        ),
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
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            )
          ],
        ),
      ),
    );
  }
}
