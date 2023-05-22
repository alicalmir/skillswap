import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:skillswap/src/features/core/models/post_model.dart';
import '../../controllers/post_controller.dart';
import '../dashboard/dascboard_screen.dart';

class AddPostScreen extends StatelessWidget {
  final postController = Get.put(PostController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.to(() => Dashboard());
          },
          icon: const Icon(
            LineAwesomeIcons.angle_left,
          ),
        ),
        title: Text(
          "Give Opportunity",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              maxLength: 25, // set maximum length to 40
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(hintText: 'Body'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                if (titleController.text.length > 25) {
                  // show snack bar if title length is more than 40
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Title can only have maximum of 25 characters.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else {
                  PostModel post = PostModel(
                    title: titleController.text,
                    body: bodyController.text,
                  );

                  await postController.addPost(post);

                  Get.back();
                }
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
