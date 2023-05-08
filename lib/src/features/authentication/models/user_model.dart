import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;

  UserModel(
      {this.id = '',
      required this.fullName,
      required this.email,
      required this.phoneNo,
      required this.password});

  void setId(String id) {
    if (this.id == null) {
      this.id = id;
    }
  }

  toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "phone": phoneNo,
      "password": password,
      "id": id
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: document.id,
        fullName: data["fullName"],
        email: data["email"],
        phoneNo: data["phone"],
        password: data["password"]);
  }
}
