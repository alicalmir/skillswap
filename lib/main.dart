import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:skillswap/src/features/authentication/controllers/otp_controller.dart';
import 'package:skillswap/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:skillswap/src/features/core/screens/profile/profile_screen.dart';
import 'package:skillswap/src/repository/authentication_repository.dart';
import 'package:skillswap/src/utils/theme/theme.dart';

import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  Get.put(OTPController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  /*final Map<String, WidgetBuilder> routes = {
    '/': (context) => BottomNavigationBarWidget(),
  };*/

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      title: 'SkillSwap',
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      //routes: routes,
      //home: const WelcomeScreen(),
      home: const ProfileScreen(),
    );
  }
}
