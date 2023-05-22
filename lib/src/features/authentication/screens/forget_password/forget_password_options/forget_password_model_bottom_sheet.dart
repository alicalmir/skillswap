import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillswap/src/features/authentication/screens/forget_password/forget_password_options/forget_password_btn_widget.dart';

import '../../../../../constants/size.dart';
import '../../../../../constants/text_string.dart';
import '../forget_password_mail/forget_password_mail.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        builder: (context) => Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tForgetPasswordTitle,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    tForgetPasswordSubTitle,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ForgetPasswordBtnWidget(
                      btnIcon: Icons.mail_outline_rounded,
                      title: tEmail,
                      subtitle: tResetViaEMail,
                      onTap: () {
                        Navigator.pop(context);
                        Get.to(() => const ForgetPasswordMailScreen());
                      }),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ForgetPasswordBtnWidget(
                      btnIcon: Icons.mobile_friendly_rounded,
                      title: tPhoneNo,
                      subtitle: tResetViaPhone,
                      onTap: () {})
                ],
              ),
            ));
  }
}
