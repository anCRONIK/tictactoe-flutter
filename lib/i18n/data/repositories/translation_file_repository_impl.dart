import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

import '../../domain/repositories/translation_file_repository.dart';

/// Implementation which reads JSON and properties files from assets directory.
class TranslationFileRepositoryImpl extends TranslationFileRepository {
  static final Logger _log = Logger('TranslationFileRepositoryImpl');

  final String _localeAssetsPath;

  TranslationFileRepositoryImpl(this._localeAssetsPath) : assert(_localeAssetsPath.isNotEmpty, 'localeAssetsPath is empty');

  @override
  Future<Map<String, String>> loadTranslationFile(Locale locale) async {
    // try loading json file
    try {
      final String response =
          await rootBundle.loadString(_toJsonPathFromLocale(locale)); //throws [FlutterError] if data is null (not loaded)
      return Future.value(_loadFromJson(response));
    } catch (e) {
      _log.severe('Error while loading translations from json file. It probably does not exists. Trying with properties file.', e);
    }

    final String response =
        await rootBundle.loadString(_toPropertiesPathJsonFromLocale(locale)); //throws [FlutterError] if data is null (not loaded)
    return Future.value(_loadFromProperties(response));
  }

  /// Create JSON file path
  String _toJsonPathFromLocale(Locale locale) {
    return '$_localeAssetsPath/${locale.languageCode}.json';
  }

  /// Create properties file path
  String _toPropertiesPathJsonFromLocale(Locale locale) {
    return '$_localeAssetsPath/${locale.languageCode}.properties';
  }

  /// Method for converting properties file text to [Map]
  static Map<String, String> _loadFromProperties(String text) {
    final properties = <String, String>{};
    final lines = text.split('\n');
    for (var i = 0; i < lines.length; i++) {
      var line = lines[i];
      line = line.trim();
      if (line.startsWith('#')) {
        continue;
      }
      if (line.isEmpty) {
        continue;
      }
      try {
        final kv = line.split('=');
        final k = kv[0];
        final v = kv[1];
        properties[k] = v;
      } catch (e) {
        throw 'The $i line is not valid line. The text is : $line';
      }
    }

    return properties;
  }

  /// Method for loading translations from JSON file
  static Map<String, String> _loadFromJson(String text) {
    return _toTranslationKeysRecursive(HashMap<String, String>(), json.decode(text) as Map);
  }

  /// Recursive method to create proper keys
  static Map<String, String> _toTranslationKeysRecursive(Map<String, String> translationKeys, Map translationMap,
      [String? previousKeyPath]) {
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
}
