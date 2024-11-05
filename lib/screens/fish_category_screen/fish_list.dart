import 'package:fish_finder/model/fish.dart';
import 'package:fish_finder/screens/fish_category_screen/components/my_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FishListScreen extends ConsumerWidget {
  const FishListScreen(
      {super.key, required this.title, required this.fishList});
  final List<Fish> fishList;
  final String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (fishList.isEmpty) {
      return Container(
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
        child: const Center(
          child: Text('No fish found'),
        ),
      );
    }

    if (title == null) {
      return Container(
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
        child: MyListView(
          fishList: fishList,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade200,
        title: const Text('FishList'),
        centerTitle: true,
      ),
      body: Container(
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
        child: MyListView(
          fishList: fishList,
        ),
      ),
    );
  }
}
