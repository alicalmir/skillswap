import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skillswap/src/constants/image_strings.dart';
import 'package:skillswap/src/constants/size.dart';

import '../../../../../constants/text_string.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(
          height: tFormHeight - 20,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              icon: Image(
                image: AssetImage(
                  tGoogleLogoImage,
                ),
                width: 20.0,
              ),
              onPressed: () {},
              label: Text(tSignInWithGoogle)),
        ),
        const SizedBox(
          height: tFormHeight - 20,
        ),
        TextButton(
            onPressed: () {},
            child: Text.rich(
              TextSpan(
                  text: tDontHaveAnAccount,
                  style: Theme.of(context).textTheme.bodyText1,
                  children: const [
                    TextSpan(
                        text: tSignup, style: TextStyle(color: Colors.blue))
                  ]),
            ))
      ],
    );
  }
}
