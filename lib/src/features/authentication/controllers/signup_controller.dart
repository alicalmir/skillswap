import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skillswap/src/features/core/screens/dashboard/dascboard_screen.dart';
import 'package:skillswap/src/repository/authentication_repository.dart';

import '../../../repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import '../screens/welcome/welcome_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  Rx<User?> firebaseUser = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    // Listen to changes in the authentication state and update firebaseUser accordingly
    FirebaseAuth.instance.authStateChanges().listen((user) {
      firebaseUser.value = user;
    });
  }

  void registerUser(String email, String password) async {
    try {
      await AuthenticationRepository.instance
          .createUserWithEmailAndPassword(email, password);
      if (firebaseUser.value != null) {
        Get.offAll(() => const Dashboard());
      } else {
        Get.to(() => const WelcomeScreen());
      }
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      // Display error message to user
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text(e.message)),
      );
    } catch (e) {
      // Handle other exceptions
      print('Unexpected error: $e');
    }
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
