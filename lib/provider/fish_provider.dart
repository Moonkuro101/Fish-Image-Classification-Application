import 'package:fish_finder/model/fish.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FishNotifier extends StateNotifier<List<Fish>> {
  FishNotifier() : super([]);

  Future<void> fetchFish() async {
    try {
      final firestore = FirebaseFirestore.instance;
      final snapshot = await firestore.collection('fishes').get();
      state = snapshot.docs.map((doc) => Fish.fromDocumentSnapshot(doc)).toList();
    } catch (error) {
      // Handle error
      state = [];
    }
  }
}

final fishlistProvider = StateNotifierProvider<FishNotifier, List<Fish>>((ref) => FishNotifier());
