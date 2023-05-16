import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String id;
  final String senderId;
  final String receiverId;
  final String name;
  final String message;
  final String date;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.name,
    required this.message,
    required this.date,
  });

  factory MessageModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return MessageModel(
      id: data['id'] as String,
      senderId: data['senderId'] as String,
      receiverId: data['receiverId'] as String,
      name: data['name'] as String,
      message: data['message'] as String,
      date: data['date'] as String,
    );
  }

}
