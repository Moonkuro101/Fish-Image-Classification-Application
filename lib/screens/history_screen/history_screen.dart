import 'package:fish_finder/material/font_and_color.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key, required this.historylist});

  final List<String> historylist;

  @override
  Widget build(BuildContext context) {
    // Default content when history list is empty
    Widget content = Center(
      child: Text(
        'No history found',
        style: fontEnglish.copyWith(fontSize: 20, color: Colors.black),
      ),
    );

    // If there are items in the history list, you could change this to display a list or other content
    if (historylist.isNotEmpty) {
      content = ListView.builder(
        itemCount: historylist.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(historylist[index]),
          );
        },
      );
    }

    return Container(
      // Make the container fill the entire screen
      width: double.infinity,
      height: double.infinity,
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
      child: content,
    );
  }
}
