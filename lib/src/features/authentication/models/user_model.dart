import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;

  UserModel(
      { this.id,
      required this.fullName,
      required this.email,
      required this.phoneNo,
      required this.password});

  void setId(String newId) {
    id = newId;
  }

  toJson() {
    return {
      "id": id,
      "fullName": fullName,
      "email": email,
      "phone": phoneNo,
      "password": password,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: data['id'],
        fullName: data["fullName"],
        email: data["email"],
        phoneNo: data["phone"],
        password: data["password"]);
  }
}
