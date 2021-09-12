import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../styles.dart';
import '../../domain/entity/theme_data_values.dart';
import '../../domain/repository/theme_data_repository.dart';
import 'abstract_application_page.dart';

/// Class which handles application global layout. Every page should use this class to .
/// Layout is modified depending on the device its orientation.
class ApplicationBasicLayout {
  final BuildContext _context;

  ApplicationBasicLayout(this._context);

  Widget addApplicationLayoutToThePage(AbstractApplicationPage _page) {
    if (GetPlatform.isWeb) {
      return _buildWebLayout(_page);
    }
    if (GetPlatform.isDesktop) {
      return _buildDesktopLayout(_page);
    }
    return _buildMobileLayout(_page);
  }

  Widget _buildWebLayout(AbstractApplicationPage _page) {
    //TODO create layout for web
    return _buildMobileLayout(_page);
  }

  Widget _buildDesktopLayout(AbstractApplicationPage _page) {
    //currently not supported so return mobile layout
    return _buildMobileLayout(_page);
  }

  Widget _buildMobileLayout(AbstractApplicationPage _page) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        //appbar
        appBar: AppBar(
          actions: [
            ObxValue(
                (darkMode) => IconButton(
                    icon: Icon(darkMode == true ? Icons.dark_mode : Icons.light_mode),
                    tooltip: 'appbar.button.change_theme.tooltip'.tr,
                    onPressed: () {
                      Get.find<ThemeDataRepository>().storeUserTheme(darkMode == true ? ThemeDataValue.light : ThemeDataValue.dark);
                      Get.changeTheme(darkMode == true ? AppThemeTemplates.lightTheme : AppThemeTemplates.darkTheme);
                    }),
                Get.isDarkMode.obs)
          ],
        ),
        //body
        body: SafeArea(
            child: SingleChildScrollView(
                padding: defaultScreenPadding,
                child: _context.orientation == Orientation.portrait
                    ? _page.buildPortraitLayout(_context)
                    : _page.buildLandscapeLayout(_context))));
  }
}
