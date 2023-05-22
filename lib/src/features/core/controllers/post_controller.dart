import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../repository/post_repository/post_repository.dart';
import '../../../repository/user_repository/user_repository.dart';
import '../models/post_model.dart';

class PostController extends GetxController {
  final PostRepository postRepository = PostRepository();
  final userRepository = UserRepository.instance;

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
    final user = FirebaseAuth.instance.currentUser;
    final userModel = await userRepository.getUserDetails(user!.email!);

    try {
      String docId = await postRepository.addPost(post, userModel);
      // Add the post to the local list of posts
      post.copyWith(id: docId);
      posts.add(post);
      return docId;
    } catch (e) {
      rethrow;
    }
  }

  void deletePost(String id) async {
    await postRepository.deletePost(id);
    // Update the list of posts after deleting a post
    posts.removeWhere((post) => post.id == id);
  }
}
