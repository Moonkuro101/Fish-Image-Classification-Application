import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fish_finder/model/fish.dart';

class FishNotifier extends StateNotifier<List<Fish>> {
  FishNotifier() : super([]);

  // This method will start listening to changes in Firestore
  void fetchFavoriteFish(String userId) {
    // Stream to listen to user document changes
    final userDocStream = FirebaseFirestore.instance.collection('users').doc(userId).snapshots();

    userDocStream.listen((userDoc) async {
      if (!userDoc.exists) {
        print('User not found');
        state = [];
        return;
      }

      final data = userDoc.data();
      final favoriteFishIds = List<String>.from(data?['favoriteFish'] ?? []);

      final List<Fish> fishList = [];

      for (var fishId in favoriteFishIds) {
        final fishSnapshot = await FirebaseFirestore.instance.collection('fishes').doc(fishId).get();
        if (fishSnapshot.exists) {
          fishList.add(Fish.fromMap(fishSnapshot.data()!));
        }
      }

      state = fishList;
    }, onError: (error) {
      print('Error listening to user document: $error');
      state = [];
    });
  }
}

// Define a StateNotifierProvider for the FishNotifier
final fishProvider = StateNotifierProvider<FishNotifier, List<Fish>>((ref) {
  // Provide an empty FishNotifier
  return FishNotifier();
});
