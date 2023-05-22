import 'package:get/get.dart';
import 'package:skillswap/src/features/authentication/models/user_model.dart';
import 'package:skillswap/src/repository/authentication_repository/authentication_repository.dart';
import 'package:skillswap/src/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  ///Repositories
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  ///Get user emial and pass to userrepository to fetch user record
  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to contiue");
    }
  }

  /// Fetch list of user records
  Future<List<UserModel>> getAllUser() async {
    return await _userRepo.allUser();
  }

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}
