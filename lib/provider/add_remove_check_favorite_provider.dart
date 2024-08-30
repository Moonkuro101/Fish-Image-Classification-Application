import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteFishNotifier extends StateNotifier<List<String>> {
  final String userId;

  FavoriteFishNotifier(this.userId) : super([]) {
    _loadFavorites();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _loadFavorites() async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();
      if (doc.exists) {
        final data = doc.data();
        state = List<String>.from(data?['favoriteFish'] ?? []);
      }
    } catch (e) {
      // Handle errors, maybe log or show a message
      print('Error loading favorites: $e');
    }
  }

  Future<void> addFavorite(String fishId) async {
    try {
      final updatedFavorites = [...state, fishId];
      await _firestore.collection('users').doc(userId).set(
        {'favoriteFish': updatedFavorites},
        SetOptions(merge: true),
      );
      state = updatedFavorites;
    } catch (e) {
      // Handle errors
      print('Error adding favorite: $e');
    }
  }

  Future<void> removeFavorite(String fishId) async {
    try {
      final updatedFavorites = state.where((id) => id != fishId).toList();
      await _firestore.collection('users').doc(userId).set(
        {'favoriteFish': updatedFavorites},
        SetOptions(merge: true),
      );
      state = updatedFavorites;
    } catch (e) {
      // Handle errors
      print('Error removing favorite: $e');
    }
  }
}

final favoriteFishProvider = StateNotifierProvider.family<FavoriteFishNotifier, List<String>, String>(
  (ref, userId) => FavoriteFishNotifier(userId),
);
