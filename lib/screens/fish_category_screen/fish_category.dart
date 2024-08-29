import 'package:fish_finder/model/fish.dart';
import 'package:fish_finder/screens/fish_category_screen/widget/fish_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FishListScreen extends ConsumerWidget {
  const FishListScreen(
      {super.key, required this.title, required this.fishList});
  final List<Fish> fishList;
  final String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (fishList.isEmpty){
      return const Center(
        child: Text('No fish found'),
      );
    }


    if (title == null) {
      return ListView.builder(
        itemCount: fishList.length,
        itemBuilder: (context, index) {
          final fish = fishList[index];
          return FishListWidget(fish: fish);
        },
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xffF0F5FF),
      appBar: AppBar(
        title: const Text('FishList'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: fishList.length,
        itemBuilder: (context, index) {
          final fish = fishList[index];
          return FishListWidget(fish: fish);
        },
      ),
    );
  }
}
