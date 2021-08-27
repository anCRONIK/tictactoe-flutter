import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entity/theme_data_values.dart';
import '../../domain/repository/theme_data_repository.dart';

class ThemeDataRepositoryImpl extends ThemeDataRepository {
  static const _keyAppTheme = 'appTheme';

  final SharedPreferences _sharedPreferences;

  ThemeDataRepositoryImpl(this._sharedPreferences);

  @override
  ThemeDataValue fetchUserTheme() {
    final int? value = _sharedPreferences.getInt(_keyAppTheme);
    if (null == value || ThemeDataValue.light.index == value) {
      return ThemeDataValue.light;
    }
    return ThemeDataValue.dark;
  }

  @override
  Future<void> storeUserTheme(ThemeDataValue value) async {
    await _sharedPreferences.setInt(_keyAppTheme, value.index);
  }
}
