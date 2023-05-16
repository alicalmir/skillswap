import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../constants/colors.dart';
import '../controller/chat_controller.dart';
import '../model/message_model.dart';

class PersonalChatScreen extends StatelessWidget {
  final String receiverId; // ID of the receiver
  final String receiverName;
  // Name of the receiver

  PersonalChatScreen(
      {Key? key, required this.receiverId, required this.receiverName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatController chatController = Get.put(ChatController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          receiverName,
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
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<MessageModel>>(
              stream: chatController.getChatMessages(
                chatController.userId.value,
                receiverId,
              ),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final messages = snapshot.data!;
                  return ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final messageInfo = messages[index];
                      final isCurrentUser =
                          messageInfo.senderId == chatController.userId.value;
                      return Container(
                        alignment: isCurrentUser
                            ? Alignment.bottomRight
                            : Alignment.bottomLeft,
                        child: Container(
                            decoration: BoxDecoration(
                                color:
                                    isCurrentUser ? Colors.blue : Colors.black,
                                borderRadius: BorderRadius.circular(12)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 7, horizontal: 14),
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 8),
                            child: Column(
                              children: [
                                Text(
                                  messageInfo.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  messageInfo.message,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 5),
                              ],
                            )),
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: chatController.messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Get the message text from the TextFormField
                    String message = chatController.messageController.text;

                    if (message.isNotEmpty) {
                      // Call the sendMessage method to send the message
                      chatController.sendMessage(receiverId, message);

                      // Clear the message text field after sending the message
                      chatController.messageController.clear();
                    }
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
