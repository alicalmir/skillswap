import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillswap/src/features/authentication/models/user_model.dart';
import 'package:uuid/uuid.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Store user in FireStore
  Future<DocumentReference> createUser(UserModel user) async {
    final docRef = await _db
        .collection("Users")
        .add(Map.from(user.toJson())..addAll({"id": Uuid().v4()}))
        .whenComplete(() => Get.snackbar(
            "Success", "You account has been created.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green))
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green);
    });
    user.setId(docRef.id);
    await docRef.update(user.toJson());
    return docRef;
  }

  ///Fetch all users or user data
  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("Users").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> updateUserRecord(UserModel user) async {
    await _db.collection("Users").doc(user.id).update(user.toJson());
  }

  /*Future<Map<String, dynamic>> getUserData(String email) async {
    final snapshot =
        await _db.collection("Users").where("email", isEqualTo: email).get();
    final userData = await snapshot.docs.map((e) => e.data()).single;
    return {
      "fullName": userData["fullName"],
      "id": userData["id"],
    };
  }*/
}
