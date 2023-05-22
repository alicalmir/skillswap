import 'package:flutter/material.dart';
import 'package:skillswap/src/common_widgets/form/form_header_widget.dart';
import 'package:skillswap/src/constants/image_strings.dart';
import 'package:skillswap/src/constants/size.dart';
import 'package:skillswap/src/constants/text_string.dart';
import 'package:skillswap/src/features/authentication/screens/login/widgets/login_fotter_widget.dart';

import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
   const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    /** Section 1 */
                    const FormHeaderWidget(
                      image: tWelcomeScreenImage,
                      title: tLoginTitle,
                      subtitle: tLoginSubTitle,
                    ),
                    /** end */
                    /** Section 2 */
                    LoginForm(),
                    /** end */
                    /**Section 3 */
                    const LoginFooterWidget()
                    /**end */

                    /** FORGET PASSWORD BOTTON */
                    ,
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
