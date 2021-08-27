import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/repository/theme_data_repository_impl.dart';
import 'domain/entity/theme_data_values.dart';
import 'domain/repository/theme_data_repository.dart';
import 'i18n/application_translations.dart';
import 'i18n/constants.dart';
import 'routing.dart';
import 'styles.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences sharedPreferences = Get.put(await SharedPreferences.getInstance(), permanent: true);
  Get.put(ThemeDataRepositoryImpl(sharedPreferences) as ThemeDataRepository);

  runApp(GetMaterialApp(
      translations: await initTranslations(),
      locale: Get.deviceLocale,
      fallbackLocale: DEFAULT_LOCALE,
      theme: Get.find<ThemeDataRepository>().fetchUserTheme() == ThemeDataValue.light
          ? AppThemeTemplates.lightTheme
          : AppThemeTemplates.darkTheme,
      getPages: AppPages.routes,
      onUnknownRoute: (settings) => GetPageRoute(settings: settings.copyWith(name: AppRoutes.ERROR))));
}
