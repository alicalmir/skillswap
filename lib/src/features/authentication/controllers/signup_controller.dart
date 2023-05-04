import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skillswap/src/repository/authentication_repository/authentication_repository.dart';
import 'package:skillswap/src/repository/user_repository/user_repository.dart';

import '../../../repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import '../models/user_model.dart';
import '../screens/forget_password/forget_password_otp/otp_screen.dart';
import '../screens/welcome/welcome_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final userRepo = Get.put(UserRepository());

  //TextField Controllers to get data from TextFields
  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
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

  registerUser(String email, String password) async {
    try {
      await AuthenticationRepository.instance
          .createUserWithEmailAndPassword(email, password);

      /*if (firebaseUser.value != null) {
        Get.off(() => const OTPScreen());
      } else {
        Get.to(() => const WelcomeScreen());
      }*/
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

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    //phoneAuthentication(user.phoneNo);
    registerUser(user.email, user.password);
    //await Get.to(() => const OTPScreen());
  }
}
