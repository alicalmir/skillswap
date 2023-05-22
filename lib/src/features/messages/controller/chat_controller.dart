import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../repository/message_repository/chat_repository.dart';
import '../../../repository/user_repository/user_repository.dart';
import '../model/message_model.dart';

class ChatController extends GetxController {
  final ChatRepository _repository = ChatRepository();
  final UserRepository _userRepository = UserRepository();
  final RxString userId = RxString('');

  TextEditingController messageController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchCurrentUser();
  }

  Future<void> fetchCurrentUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final currentUser = await _userRepository.getUserDetails(user.email!);
      if (currentUser != null) {
        userId.value = currentUser.id!;
        update(); // Update the UI with the new user ID
      }
    }
  }

  Stream<List<MessageModel>> getChatMessages(
      String senderId, String receiverId) {
    return _repository.getChatMessages(senderId, receiverId);
  }

  Future<List<MessageModel>> getChatList(String userId) async {
    return await _repository.getChatList(userId);
  }

  Future<void> sendMessage(String receiverId, String message) async {
    await _repository.sendMessage(userId.value, receiverId, message);

    /*// Add the conversation to the receiver's chat list
    await _repository.sendMessage(userId.value, receiverId, message);*/
  }
}
