import 'package:flutter/material.dart';
import 'package:skillswap/src/common_widgets/form/form_header_widget.dart';
import 'package:skillswap/src/constants/image_strings.dart';
import 'package:skillswap/src/constants/size.dart';
import 'package:skillswap/src/constants/text_string.dart';
import 'package:skillswap/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FormHeaderWidget(
                  image: tWelcomeScreenImage,
                  title: tSignUpTitle,
                  subtitle: tSignUpSubTitle),
              const SignUpFormWidget(),
              Column(
                children: [
                  const Text("OR"),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Image(
                          image: AssetImage(tGoogleLogoImage),
                          width: 20.0,
                        ),
                        label: const Text(tSignInWithGoogle)),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: tAlreadyHaveAnAccount,
                            style: Theme.of(context).textTheme.bodyText1),
                        TextSpan(text: tLogin.toUpperCase())
                      ])))
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
