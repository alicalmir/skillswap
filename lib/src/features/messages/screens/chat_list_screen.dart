import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:skillswap/src/features/messages/screens/chat_screen.dart';
import '../../../constants/colors.dart';
import '../controller/chat_controller.dart';
import '../model/message_model.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatController chatController = Get.find<ChatController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Chat List',
          style: Theme.of(context).textTheme.headline4,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            LineAwesomeIcons.angle_left,
            color: tDarkColor,
          ),
        ),
      ),
      body: FutureBuilder<List<MessageModel>>(
          future: chatController.getChatList(chatController.userId.value),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
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
            }
          }),
    );
  }
}
