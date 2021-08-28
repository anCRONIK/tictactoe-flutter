import 'dart:ui';

/// Repository for loading translations as Map
abstract class TranslationFileRepository {
  /// Method for loading translation file for given locale [locale] as map. Implementation can fully use locale or just country code.
  Future<Map<String, String>> loadTranslationFile(Locale locale);
}
