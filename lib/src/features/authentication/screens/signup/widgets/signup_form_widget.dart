import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillswap/src/features/authentication/controllers/signup_controller.dart';
import 'package:skillswap/src/features/authentication/models/user_model.dart';
import 'package:skillswap/src/features/core/screens/dashboard/dascboard_screen.dart';
import '../../../../../constants/size.dart';
import '../../../../../constants/text_string.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.fullName,
                decoration: const InputDecoration(
                    label: Text(tFullName),
                    prefixIcon: Icon(Icons.person_outline_rounded)),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: controller.email,
                decoration: const InputDecoration(
                    label: Text(tEmail),
                    prefixIcon: Icon(Icons.email_outlined)),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: controller.phoneNo,
                decoration: const InputDecoration(
                    label: Text(tPhoneNo), prefixIcon: Icon(Icons.numbers)),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: controller.password,
                decoration: const InputDecoration(
                    label: Text(tPassword),
                    prefixIcon: Icon(Icons.fingerprint)),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final user = UserModel(
                        fullName: controller.fullName.text.trim(),
                        email: controller.email.text.trim(),
                        phoneNo: controller.phoneNo.text.trim(),
                        password: controller.password.text.trim(),
                      );

                      SignUpController.instance.createUser(user);

                      Get.to(() => Dashboard());
                      /*try {
                        SignUpController.instance.registerUser(
                            controller.email.text.trim(),
                            controller.password.text.trim());
                      } catch (e) {
                        // Handle exceptions
                        print('Unexpected error: $e');
                      }*/
                    }
                  },
                  child: Text(tSignup.toUpperCase()),
                ),
                /*ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          SignUpController.instance.registerUser(
                              controller.email.text.trim(),
                              controller.password.text.trim());
                          /*SignUpController.instance.phoneAuthentication(
                              controller.phoneNo.text.trim());*/
                          Get.to(() => const Dashboard());
                        }
                      },
                      child: Text(tSignup.toUpperCase())),*/
              ),
            ],
          )),
    );
  }
}
