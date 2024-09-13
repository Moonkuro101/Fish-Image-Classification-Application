import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fish_finder/material/font_and_color.dart';
import 'package:fish_finder/model/history_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      return Center(
        child: Text(
          'User not logged in',
          style: fontEnglish.copyWith(fontSize: 20, color: Colors.black),
        ),
      );
    }

    return StreamBuilder<DatabaseEvent>(
      stream: FirebaseDatabase.instance.ref('history/$userId').onValue,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error fetching data',
              style: fontEnglish.copyWith(fontSize: 20, color: Colors.black),
            ),
          );
        }

        final data = snapshot.data?.snapshot.value as Map?;
        final historyList = data != null
            ? (data as Map)
                .values
                .map((item) => History.fromMap(item as Map<dynamic, dynamic>))
                .toList()
            : [];
        historyList.reversed.toList();

        if (historyList.isEmpty) {
          return Center(
            child: Text(
              'No history found',
              style: fontEnglish.copyWith(fontSize: 20, color: Colors.black),
            ),
          );
        }

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
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two items per row
              crossAxisSpacing: 8.0, // Space between columns
              mainAxisSpacing: 8.0, // Space between rows
              childAspectRatio: 1.0, // Adjust as needed
            ),
            padding: const EdgeInsets.all(8.0),
            itemCount: historyList.length,
            itemBuilder: (context, index) {
              final historyItem = historyList[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      16.0), // Same radius for consistency
                ),
                elevation: 4.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16.0),
                          topLeft: Radius.circular(16.0),
                        ), // Match card border radius
                        child: Image.network(
                          historyItem.imageUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      textAlign: TextAlign.center,
                      historyItem.fishName,
                      style: fontEnglish.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      '${historyItem.timestamp}\nConfidence: ${historyItem.confidence.toStringAsFixed(2)}',
                      style: fontEnglish.copyWith(fontSize: 14),
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
