import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:skillswap/src/constants/size.dart';
import 'package:skillswap/src/constants/text_string.dart';
import 'package:skillswap/src/features/authentication/controllers/otp_controller.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var otp;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                tOtpTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 80.0,
                ),
              ),
              Text(
                tOtpSubTitle.toUpperCase(),
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                tOtpMessage,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onSubmit: (code) {
                  otp = code;
                  OTPController.instance.verifyOTP(otp);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        OTPController.instance.verifyOTP(otp);
                      },
                      child: Text(tNext)))
            ],
          ),
        ),
      ),
    );
  }
}
