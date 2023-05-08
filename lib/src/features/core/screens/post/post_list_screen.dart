import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:skillswap/src/constants/size.dart';
import 'package:skillswap/src/features/core/controllers/post_controller.dart';
import 'package:skillswap/src/features/core/models/post_model.dart';
import 'package:skillswap/src/features/core/screens/post/widget/post_item.dart';

import '../../../../constants/colors.dart';

class PostListScreen extends StatelessWidget {
  final postController = Get.put(PostController());

  PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              LineAwesomeIcons.angle_left,
              color: tDarkColor,
            )),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.headline4,
            children: const <TextSpan>[
              TextSpan(
                text: 'Find Your ',
                style: TextStyle(color: tPrimaryColor),
              ),
              TextSpan(
                text: 'Opportunity',
              ),
            ],
          ),
        ),
      ),
      body: Obx(() {
        if (postController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              postController.fetchPosts();
            },
            child: ListView.separated(
              padding: const EdgeInsets.all(tDashBoardPadding),
              itemCount: postController.posts.length,
              itemBuilder: (context, index) {
                PostModel post = postController.posts[index];
                return PostItem(
                  post: post,
                  onPressed: () {
                    // Navigate to post details screen
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 16),
            ),
          );
        }
      }),
    );
  }
}
