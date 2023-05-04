import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:skillswap/src/features/core/screens/dashboard/dascboard_screen.dart';
import 'package:skillswap/src/features/authentication/screens/welcome/welcome_screen.dart';

import 'exceptions/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  void _setInitialScreen(User? user) {
    if (FirebaseAuth.instance.currentUser == null) {
      Get.off(() => const WelcomeScreen());
    } else {
      Get.off(() => const Dashboard());
    }
  }

  //
  void phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'The provided phone number is not valid');
        } else {
          Get.snackbar('Error', 'Something went wrong. Try aaagain.');
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Account creation was successful, show success message to user

      Get.snackbar(
          'Account created', 'Your account has been created successfully');
      /*firebaseUser.value != null
          ? Get.off(() => const Dashboard())
          : Get.to(() => const WelcomeScreen());*/
    } on FirebaseException catch (e) {
      // Account creation failed, show error message to user
      Get.snackbar('Error', e.toString());
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (e) {
      // Account creation failed, show error message to user
      Get.snackbar('Error', e.toString());
      var ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (e) {
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
