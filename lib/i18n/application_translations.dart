import 'dart:async';
import 'dart:collection';

import 'package:get/get.dart';
import 'package:logging/logging.dart';

import 'constants.dart';
import 'data/repositories/translation_file_repository_impl.dart';
import 'domain/repositories/translation_file_repository.dart';

/// Implementation of [Translations] which loads all application translations
class ApplicationTranslations extends Translations {
  final Map<String, Map<String, String>> _translationKeys;

  ApplicationTranslations(this._translationKeys);

  @override
  Map<String, Map<String, String>> get keys => _translationKeys;
}

/// Method for initializing translations to be used by application
Future<Translations> initTranslations() async {
  final Logger log = Logger('ApplicationTranslations');

  TranslationFileRepository? repository = TranslationFileRepositoryImpl(TRANSLATION_FILES_PATH);

  /// Populates [keys] for all supported translations (defined with [supportedLocales])
  final Map<String, Map<String, String>> translationKeys = HashMap();
  for (final locale in SUPPORTED_LOCALES) {
    final String localeAsString = locale.toString();
    translationKeys[localeAsString] = HashMap();

    try {
      final translationMap = await repository.loadTranslationFileAsMap(locale);
      translationKeys[localeAsString] = _toTranslationKeys(translationMap);
    } catch (e) {
      log.severe('Error while loading translations for file $locale', e);
    }
  }
  repository = null; //gc

  return Future.value(ApplicationTranslations(translationKeys));
}

Map<String, String> _toTranslationKeys(Map translationMap) {
  return _toTranslationKeysRecursive(HashMap<String, String>(), translationMap);
}

Map<String, String> _toTranslationKeysRecursive(Map<String, String> translationKeys, Map translationMap, [String? previousKeyPath]) {
  if (translationMap.isNotEmpty) {
    translationMap.forEach((key, value) {
      String currentKeyPath = key.toString();
      if (null != previousKeyPath) {
        currentKeyPath = '$previousKeyPath.$key';
      }
      if (value is Map) {
        _toTranslationKeysRecursive(translationKeys, value, currentKeyPath);
      } else {
        translationKeys[currentKeyPath] = value.toString();
      }
    });
  }
  return translationKeys;
}
