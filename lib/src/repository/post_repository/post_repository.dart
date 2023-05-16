import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../../features/authentication/models/user_model.dart';
import '../../features/core/models/post_model.dart';
import '../user_repository/user_repository.dart';

class PostRepository extends GetxController {
  final _db = FirebaseFirestore.instance;
  static PostRepository get instance => Get.find<PostRepository>();

  Future<String> addPost(PostModel post, UserModel user) async {
    try {
      final uuid = Uuid();
      final postWithId = post.copyWith(
        id: uuid.v4(),
        userName: user.fullName,
        userId: user.id,
      );

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
