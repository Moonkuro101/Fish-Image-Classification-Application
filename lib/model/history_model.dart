class History {
  final String imageUrl;
  final String fishName;
  final double confidence;
  final String userId;
  final String timestamp;

  History({
    required this.imageUrl,
    required this.fishName,
    required this.confidence,
    required this.userId,
    required this.timestamp,
  });

  // Convert a Map to a History object
  factory History.fromMap(Map<dynamic, dynamic> map) {
    return History(
      imageUrl: map['imageUrl'] ?? '',
      fishName: map['fishName'] ?? '',
      confidence: map['confidence']?.toDouble() ?? 0.0,
      userId: map['userId'] ?? '',
      timestamp: map['timestamp'] ?? '',
    );
  }

  // Convert a History object to a Map
  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'fishName': fishName,
      'confidence': confidence,
      'userId': userId,
      'timestamp': timestamp,
    };
  }
}
