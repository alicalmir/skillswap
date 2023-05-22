import 'package:get/get.dart';
import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../core/screens/dashboard/dascboard_screen.dart';

class LoginController extends GetxController {
  final AuthenticationRepository _authRepo =
      Get.find<AuthenticationRepository>();

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _authRepo.loginWithEmailAndPassword(email, password);
      // If login is successful, navigate to the dashboard screen
      Get.offAll(Dashboard());
    } catch (_) {
      // Show error message to the user
      Get.snackbar('Error', 'Login failed. Please check your credentials.');
    }
  }
}
