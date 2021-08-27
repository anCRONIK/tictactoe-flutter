import '../entity/theme_data_values.dart';

abstract class ThemeDataRepository {
  ThemeDataValue fetchUserTheme();

  void storeUserTheme(ThemeDataValue value);
}
