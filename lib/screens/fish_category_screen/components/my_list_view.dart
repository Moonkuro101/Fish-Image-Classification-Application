import 'package:fish_finder/model/fish.dart';
import 'package:fish_finder/screens/fish_category_screen/components/fish_list_widget.dart';
import 'package:flutter/material.dart';

class MyListView extends StatelessWidget{
  const MyListView({super.key, required this.fishList});

  final List<Fish> fishList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: fishList.length,
          itemBuilder: (context, index) {
            final fish = fishList[index];
            return FishListWidget(fish: fish);
          },
        );
  }
}