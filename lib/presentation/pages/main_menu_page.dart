import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/presentation/widgets/abstract_application_page.dart';

import '../../routing.dart';

/// Main menu page
class MainMenuPage extends AbstractApplicationPage {
  const MainMenuPage({Key? key}) : super(key: key);

  @override
  Widget buildLandscapeLayout(BuildContext context) {
    return buildPortraitLayout(context);
  }

  @override
  Widget buildPortraitLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // play vs pc
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Theme.of(context).primaryColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [const Icon(Icons.computer), Text('page.main_menu.button.play_vs_pc.text'.tr.toUpperCase())],
          ),
          onPressed: () => Get.toNamed(AppRoutes.ROOT),
        ),

        // play vs player
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Theme.of(context).primaryColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [const Icon(Icons.people), Text('page.main_menu.button.play_offline.text'.tr.toUpperCase())],
          ),
          onPressed: () => Get.toNamed(AppRoutes.ROOT),
        ),

        //play online
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Theme.of(context).primaryColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [const Icon(Icons.mail), Text('page.main_menu.button.play_online.text'.tr.toUpperCase())],
          ),
          onPressed: () => Get.toNamed(AppRoutes.ROOT),
        )
      ],
    );
  }
}
