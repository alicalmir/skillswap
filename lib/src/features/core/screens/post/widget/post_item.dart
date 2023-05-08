import 'package:flutter/material.dart';
import 'package:skillswap/src/constants/colors.dart';
import 'package:skillswap/src/features/core/models/post_model.dart';
import 'package:get/get.dart';

class PostItem extends StatelessWidget {
  final PostModel post;
  final VoidCallback onPressed;

  const PostItem({Key? key, required this.post, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: tPrimaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    post.body.split(" ").length > 40
                        ? "${post.body.split(" ").take(20).join(" ")}..."
                        : post.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16, color: tDarkColor),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to post details screen
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child:
                  const Text('Details', style: TextStyle(color: tPrimaryColor)),
            ),
          ],
        ),
      ),
    );
  }
}
