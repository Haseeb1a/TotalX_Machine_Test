import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final int age;
  final String image;
  final Timestamp? timestamp;

  UserModel({
    this.timestamp,
    required this.name,
    required this.age,
    required this.image,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      timestamp: map['timestamp'],
      name: map['name'] ?? '',
      age: map['age'] ?? 0,
      image: map['image'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'image': image,
      'timestamp': timestamp ?? FieldValue.serverTimestamp(),
    };
  }
}
