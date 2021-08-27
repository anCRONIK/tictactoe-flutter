import 'package:flutter/material.dart';

import '../widgets/abstract_application_page.dart';
import '../widgets/game_room.dart';

class OfflineGamePage extends AbstractApplicationPage {
  const OfflineGamePage({Key? key}) : super(key: key);

  @override
  Widget buildLandscapeLayout(BuildContext context) {
    return buildPortraitLayout(context);
  }

  @override
  Widget buildPortraitLayout(BuildContext context) {
    return GameRoom();
  }
}
