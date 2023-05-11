import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:skillswap/src/constants/colors.dart';
import 'package:skillswap/src/constants/image_strings.dart';
import 'package:skillswap/src/constants/size.dart';
import 'package:skillswap/src/constants/text_string.dart';
import 'package:skillswap/src/features/core/screens/profile/profile_screen.dart';
import '../../controllers/post_controller.dart';
import '../../models/post_model.dart';
import '../post/add_post_screen.dart';
import '../post/post_list_screen.dart';
import '../post/widget/post_item.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final postController = Get.put(PostController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //variables
    final txtTheme = Theme.of(context).textTheme;
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.headline4,
            children: const <TextSpan>[
              TextSpan(
                text: 'Skill',
                style: TextStyle(color: tPrimaryColor),
              ),
              TextSpan(
                text: 'Swap',
              ),
            ],
          ),
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
            margin: const EdgeInsets.only(right: 20, top: 7),
            decoration: BoxDecoration(
                color: isDark ? tSecondaryColor : tCardBgColor,
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              onPressed: () {
                Get.to(() => const ProfileScreen());
              },
              icon: const Image(image: AssetImage(tPRofileImages)),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(tDashBoardPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tDashboardTitle, style: txtTheme.bodyText2),
                  Text(
                    tDashboardHeading,
                    style: txtTheme.headline2,
                  ),
                  const SizedBox(
                    height: tDashBoardPadding,
                  ),

                  //Search Box
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(left: BorderSide(width: 4))),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tDashboardSearch,
                          style: txtTheme.headline2
                              ?.apply(color: Colors.grey.withOpacity(0.5)),
                        ),
                        const Icon(
                          Icons.mic,
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: tDashBoardPadding + 5,
                  ),
                  //Find botton
                  InkWell(
                    onTap: () {
                      Get.to(() => PostListScreen());
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 80,
                          decoration: const BoxDecoration(
                            color: tPrimaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.search,
                                size: 44,
                                color: tWhiteColor,
                              ),
                              const SizedBox(width: 8),
                              RichText(
                                text: TextSpan(
                                  style: txtTheme.headline2,
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: 'Find',
                                      style: TextStyle(color: tWhiteColor),
                                    ),
                                    TextSpan(
                                      text: ' Opportunities',
                                      style: TextStyle(color: tWhiteColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned.fill(
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              border: Border.all(color: Colors.black, width: 2),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0.0),
                                  tPrimaryColor.withOpacity(0.2),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /*InkWell(
                    onTap: () {
                      Get.to(() => PostListScreen());
                    },
                    child: Row(
                      children: [
                        Flexible(
                          child: Container(
                            height: 80,
                            decoration: const BoxDecoration(
                              color: tPrimaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.search,
                                  size: 44,
                                  color: tWhiteColor,
                                ),
                                const SizedBox(width: 8),
                                RichText(
                                  text: TextSpan(
                                    style: txtTheme.headline2,
                                    children: const <TextSpan>[
                                      TextSpan(
                                        text: 'Find',
                                        style: TextStyle(color: tWhiteColor),
                                      ),
                                      TextSpan(
                                          text: ' Opportunities',
                                          style: TextStyle(color: tWhiteColor)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )*/
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddPostScreen());
        },
        backgroundColor: isDark ? tCardBgColor : tDarkColor,
        child: Icon(
          Icons.add,
          color: isDark ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
