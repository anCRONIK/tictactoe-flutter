import 'package:get/get.dart';

import '../presentation/manager/game_room_controller.dart';
import '../presentation/pages/offline_game_page.dart';
import 'presentation/pages/error_page.dart';
import 'presentation/pages/main_menu_page.dart';

class AppPages {
  AppPages._();

  static final GetPage errorRoute = GetPage(name: AppRoutes.ERROR, page: () => const ErrorPage());

  static final routes = [
    errorRoute,
    GetPage(name: AppRoutes.ROOT, page: () => const MainMenuPage(), middlewares: [], children: [
      GetPage(name: AppRoutes.GAME_OFFLINE, page: () => const OfflineGamePage(), binding: GameRoomBinding()),
    ]),
  ];
}

class GameRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameRoomController>(() => GameRoomController());
  }
}

abstract class AppRoutes {
  AppRoutes._();

  static const ROOT = '/';
  static const ERROR = '/error';

  static const GAME_OFFLINE = '/game';
}
