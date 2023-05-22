import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/messages/model/message_model.dart';

class ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Store chat message in Firestore
  Future<void> sendMessage(
      String senderId, String receiverId, String message) async {
    final data = {
      'name': 'Your Name', // Replace with sender's name
      'message': message,
      'senderId': senderId,
      'receiverId': receiverId,
      'date': DateTime.now().toString(),
    };

    final messageRef = await _firestore.collection('PersonalChat').add(data);

    // Add the conversation to the receiver's chat list
    final receiverChatListRef = _firestore
        .collection('ChatList')
        .doc(receiverId)
        .collection('messagesList')
        .doc(senderId);

    final receiverChatListDoc = await receiverChatListRef.get();

    if (receiverChatListDoc.exists) {
      // Conversation already exists, update the last message and time
      await receiverChatListRef.update({
        'message': message,
        'time': FieldValue.serverTimestamp(),
      });
    } else {
      // Conversation doesn't exist, create a new document
      await receiverChatListRef.set({
        'name': 'Your Name', // Replace with sender's name
        'message': message,
        'id': senderId,
        'date': DateTime.now().toString(),
      });
    }

    // Add the conversation to the sender's chat list
    final senderChatListRef = _firestore
        .collection('ChatList')
        .doc(senderId)
        .collection('messagesList')
        .doc(receiverId);

    final senderChatListDoc = await senderChatListRef.get();

    if (senderChatListDoc.exists) {
      // Conversation already exists, update the last message and time
      await senderChatListRef.update({
        'message': message,
        'time': FieldValue.serverTimestamp(),
      });
    } else {
      // Conversation doesn't exist, create a new document
      await senderChatListRef.set({
        'name': 'Receiver Name', // Replace with receiver's name
        'message': message,
        'receiverId': receiverId,
        'senderId': senderId,
        'date': DateTime.now().toString(),
        'token': 'Receiver Token', // Replace with receiver's token
      });
    }
  }

  // Get personal chat messages between sender and receiver
  Stream<List<MessageModel>> getChatMessages(
      String senderId, String receiverId) {
    return _firestore
        .collection('PersonalChat')
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              final data = doc.data();

              return MessageModel(
                name: data['name'],
                message: data['message'],
                senderId: data['senderId'],
                receiverId: data['receiverId'],
                id: doc.id, // Use the document ID as the message ID
                date: data['date'],
              );
            }).toList());
  }

  Future<List<MessageModel>> getChatList(String userId) async {
    final snapshot = await _firestore
        .collection('ChatList')
        .doc(userId)
        .collection('messagesList')
        .orderBy('date', descending: true)
        .get();

print('Number of chat list documents: ${snapshot.docs.length}');

    final chatList = snapshot.docs.map((doc) {
      print('Document ID: ${doc.id}');
      final data = doc.data();

      return MessageModel(
        name: data['name'],
        message: data['message'],
        senderId: userId,
        receiverId: data['id'],
        id: doc.id,
        date: data['date'],
      );
    }).toList();

    return chatList;
  }
}
