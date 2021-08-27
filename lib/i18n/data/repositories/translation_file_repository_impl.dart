import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../domain/repositories/translation_file_repository.dart';

/// Implementation which reads JSON files from assets directory.
class TranslationFileRepositoryImpl extends TranslationFileRepository {
  final String _localeAssetsPath;

  TranslationFileRepositoryImpl(this._localeAssetsPath) : assert(_localeAssetsPath.isNotEmpty, 'localeAssetsPath is empty');

  @override
  Future<Map> loadTranslationFileAsMap(Locale locale) async {
    final String response = await rootBundle.loadString(_toPathFromLocale(locale)); //throws [FlutterError] if data is null (not loaded)

    return Future.value(json.decode(response) as Map);
  }

  String _toPathFromLocale(Locale locale) {
    return '$_localeAssetsPath/${locale.languageCode}.json';
  }
}
