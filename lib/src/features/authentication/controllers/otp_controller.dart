import 'package:get/get.dart';
import 'package:skillswap/src/features/core/screens/dashboard/dascboard_screen.dart';
import 'package:skillswap/src/repository/authentication_repository.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const Dashboard()) : Get.back();
  }
}
