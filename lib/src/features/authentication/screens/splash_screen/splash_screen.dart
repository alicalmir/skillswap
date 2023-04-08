import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skillswap/src/constants/image_strings.dart';
import 'package:skillswap/src/constants/size.dart';
import 'package:skillswap/src/constants/text_string.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          const Positioned(
            top: 0,
            left: 0,
            child: Image(
              image: AssetImage(tSplashTopIcon),
            ),
          ),
          Positioned(
            top: 40,
            left: tDefaultSize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tAppName,
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  tAppTagLine,
                  style: Theme.of(context).textTheme.headline2,
                )
              ],
            ),
          ),
          const Positioned(
            top: 40,
            child: Image(
              image: AssetImage(tSplashImage),
            ),
          ),
        ],
      ),
    ));
  }
}
