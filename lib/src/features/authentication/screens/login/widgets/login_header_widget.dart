import 'package:flutter/material.dart';
import 'package:skillswap/src/constants/text_string.dart';

import '../../../../../constants/image_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key, required this.size});

  final Size size;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
            image: const AssetImage(tWelcomeScreenImage),
            height: size.height * 0.2),
        Text(
          tLoginTitle,
          style: Theme.of(context).textTheme.headline1,
        ),
        Text(
          tLoginSubTitle,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
