import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../../features/core/models/post_model.dart';

class PostRepository extends GetxController {
  final _db = FirebaseFirestore.instance;

  Future<String> addPost(PostModel post) async {
    try {
      // Generate a UUID for the post
      final uuid = Uuid();
      final postWithId = post.copyWith(id: uuid.v4());

      DocumentReference docRef =
          await _db.collection("Posts").add(postWithId.toJson());
      return docRef.id;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<PostModel>> getPosts() async {
    final snapshot = await _db.collection("Posts").get();
    return snapshot.docs
        .map<PostModel>((doc) => PostModel.fromJson(doc.data()))
        .toList();
  }

  Future<void> deletePost(String id) async {
    await _db.collection("Posts").doc(id).delete();
  }
}
