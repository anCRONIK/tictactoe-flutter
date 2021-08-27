import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../styles.dart';
import '../../domain/entity/theme_data_values.dart';
import '../../domain/repository/theme_data_repository.dart';

/// Button for using in [AppBar] which handles application theme change between light and dark.
final IconButton changeAppThemeActionButton = IconButton(
    icon: Icon(Get.isDarkMode ? Icons.light_mode : Icons.dark_mode),
    tooltip: 'appbar.button.change_theme.tooltip'.tr,
    onPressed: () {
      RxBool darkMode = Get.isDarkMode.obs;

      Get.find<ThemeDataRepository>().storeUserTheme(Get.isDarkMode ? ThemeDataValue.light : ThemeDataValue.dark);
      Get.changeTheme(Get.isDarkMode ? AppThemeTemplates.lightTheme : AppThemeTemplates.darkTheme);
    });
