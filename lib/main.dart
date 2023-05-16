import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillswap/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:skillswap/src/features/messages/controller/chat_controller.dart';
import 'package:skillswap/src/repository/authentication_repository/authentication_repository.dart';
import 'package:skillswap/src/repository/message_repository/chat_repository.dart';
import 'package:skillswap/src/repository/user_repository/user_repository.dart';
import 'package:skillswap/src/utils/theme/theme.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Register dependencies with GetX
  Get.put(AuthenticationRepository());
  Get.put(UserRepository());
  Get.put(ChatRepository());
  Get.put(ChatController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key})
      : super(
            key:
                key); /*final Map<String, WidgetBuilder> routes = {
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
      home: const WelcomeScreen(),
    );
  }
}
