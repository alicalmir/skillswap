import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillswap/src/features/messages/screens/chat_screen.dart';
import '../controller/chat_controller.dart';
import '../model/message_model.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final ChatController chatController = Get.put(ChatController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat List'),
      ),
      body: StreamBuilder<List<MessageModel>>(
        stream: chatController.getChatList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final chatList = snapshot.data!;
            return ListView.builder(
              itemCount: chatList.length,
              itemBuilder: (context, index) {
                final chat = chatList[index];
                return ListTile(
                  title: Text(chat.name),
                  subtitle: Text(chat.message),
                  onTap: () {
                    // Open the personal chat screen for the selected chat
                    Get.to(() => PersonalChatScreen(
                          receiverId: chat.id,
                          receiverName: chat.name,
                        ));
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
