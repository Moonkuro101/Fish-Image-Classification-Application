import 'package:cloud_firestore/cloud_firestore.dart';

class Fish {
  final String id;
  final String name;
  final String scientificName; // New attribute
  final String description;
  final String imageUrl;
  final String habitat;
  final double averageSize; // in cm
  final double averageWeight; // in kg
  final bool isEndangered;
  final String conservationStatus; // New attribute
  final List<String> commonNames; // New attribute
  final String diet; // New attribute
  final String reproduction; // New attribute
  final String lifespan; // New attribute

  Fish({
    this.id = '',
    required this.name,
    required this.scientificName,
    required this.description,
    required this.imageUrl,
    required this.habitat,
    required this.averageSize,
    required this.averageWeight,
    required this.isEndangered,
    required this.conservationStatus,
    required this.commonNames,
    required this.diet,
    required this.reproduction,
    required this.lifespan,
  });

  // Convert a Fish object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'scientificName': scientificName,
      'description': description,
      'imageUrl': imageUrl,
      'habitat': habitat,
      'averageSize': averageSize,
      'averageWeight': averageWeight,
      'isEndangered': isEndangered,
      'conservationStatus': conservationStatus,
      'commonNames': commonNames,
      'diet': diet,
      'reproduction': reproduction,
      'lifespan': lifespan,
    };
  }

  // Create a Fish object from a Map object
  factory Fish.fromMap(Map<String, dynamic> map) {
    return Fish(
      id: map['id'],
      name: map['name'],
      scientificName: map['scientificName'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      habitat: map['habitat'],
      averageSize: map['averageSize'].toDouble(),
      averageWeight: map['averageWeight'].toDouble(),
      isEndangered: map['isEndangered'],
      conservationStatus: map['conservationStatus'],
      commonNames: List<String>.from(map['commonNames']),
      diet: map['diet'],
      reproduction: map['reproduction'],
      lifespan: map['lifespan'],
    );
  }

  // Convert a Fish object into a Firestore DocumentSnapshot
  factory Fish.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Fish(
      id: doc.id,
      name: data['name'],
      scientificName: data['scientificName'],
      description: data['description'],
      imageUrl: data['imageUrl'],
      habitat: data['habitat'],
      averageSize: data['averageSize'].toDouble(),
      averageWeight: data['averageWeight'].toDouble(),
      isEndangered: data['isEndangered'],
      conservationStatus: data['conservationStatus'],
      commonNames: List<String>.from(data['commonNames']),
      diet: data['diet'],
      reproduction: data['reproduction'],
      lifespan: data['lifespan'],
    );
  }
}
