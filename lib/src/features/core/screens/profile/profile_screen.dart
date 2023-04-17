import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:skillswap/src/constants/colors.dart';
import 'package:skillswap/src/constants/image_strings.dart';
import 'package:skillswap/src/constants/size.dart';
import 'package:skillswap/src/constants/text_string.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            LineAwesomeIcons.angle_left,
          ),
        ),
        title: Text(
          tProfile,
          style: Theme.of(context).textTheme.headline4,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const Image(
                  image: AssetImage(tPRofileImages),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(tProfileHeading, style: Theme.of(context).textTheme.headline4),
            Text(
              tProfileSubHEading,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: tPrimaryColor,
                    side: BorderSide.none,
                    shape: const StadiumBorder()),
                child: const Text(
                  tEditProfile,
                  style: TextStyle(color: tDarkColor),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),

            //MENU
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: tAccentColor.withOpacity(0.1),
                ),
                child: const Icon(
                  LineAwesomeIcons.cog,
                  color: tAccentColor,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
