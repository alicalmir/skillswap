import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skillswap/src/constants/colors.dart';
import 'package:skillswap/src/constants/image_strings.dart';
import 'package:skillswap/src/constants/size.dart';
import 'package:skillswap/src/constants/text_string.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            tAppName,
            style: Theme.of(context).textTheme.headline4,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                  color: tCardBgColor, borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                onPressed: () {},
                icon: const Image(image: AssetImage(tPRofileImages)),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDashBoardPadding),
          ),
        ));
  }
}
