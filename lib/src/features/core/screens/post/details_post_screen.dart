import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../models/post_model.dart';

/*class DetailsScreen extends StatelessWidget {
  final PostModel post;

  const DetailsScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(
                color: tPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    post.title,
                    style: const TextStyle(
                      color: tWhiteColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                post.body,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Posted by ${post.authorName}',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Apply with message
                  },
                  child: const Text('Apply with Message'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Apply
                  },
                  child: const Text('Apply'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // View user
                  },
                  child: const Text('View User'),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}*/
