import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../repository/post_repository/post_repository.dart';
import '../models/post_model.dart';

class PostController extends GetxController {
  final PostRepository postRepository = PostRepository();

  RxList<PostModel> posts = <PostModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  void fetchPosts() async {
    isLoading.value = true;
    try {
      List<PostModel> fetchedPosts = await postRepository.getPosts();
      posts.value = fetchedPosts;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  Future<String> addPost(PostModel post) async {
    try {
      String docId = await postRepository.addPost(post);
      // Add the post to the local list of posts
      post.copyWith(id: docId);
      posts.add(post);
      return docId;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  void deletePost(String id) async {
    await postRepository.deletePost(id);
    // Update the list of posts after deleting a post
    posts.removeWhere((post) => post.id == id);
  }
}
