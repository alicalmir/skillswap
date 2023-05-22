import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillswap/src/constants/size.dart';
import 'package:skillswap/src/constants/text_string.dart';
import 'package:skillswap/src/features/authentication/screens/forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';
import '../../../controllers/login_controller.dart';

class LoginForm extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());
  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Form(
      child: Container(
        padding:  const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: emailController,
              decoration:  const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: tEmail,
                  hintText: tEmail,
                  border: OutlineInputBorder()),
            ),
             const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration:  const InputDecoration(
                  prefixIcon: Icon(Icons.fingerprint),
                  labelText: tPassword,
                  hintText: tPassword,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: null, icon: Icon(Icons.remove_red_eye_sharp))),
            ),
             const SizedBox(
              height: tFormHeight - 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    ForgetPasswordScreen.buildShowModalBottomSheet(context);
                  },
                  child:  const Text(tForgetPassword)),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    final email = emailController.text;
                    final password = passwordController.text;
                    _loginController.loginWithEmailAndPassword(email, password);
                  },
                  child: Text(tLogin.toUpperCase())),
            )
          ],
        ),
      ),
    );
  }
}
