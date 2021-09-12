import 'package:get/get.dart';

/// Implementation of [Translations] which loads all application translations
class ApplicationTranslations extends Translations {
  final Map<String, Map<String, String>> _translationKeys;

  ApplicationTranslations(this._translationKeys);

  @override
  Map<String, Map<String, String>> get keys => _translationKeys;
}
