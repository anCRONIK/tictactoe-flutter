import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/i18n/constants.dart';
import 'package:tictactoe/i18n/data/repositories/translation_file_repository_impl.dart';

void main() {
  group('loadTranslationFileAsMap', () {
    testWidgets('translation files path does not exists, FlutterError while reading file', (tester) async {
      //need to use test widgets so that file can be loaded
      // arrange
      final TranslationFileRepositoryImpl repository = TranslationFileRepositoryImpl('foobar');
      // act
      // assert
      expect(repository.loadTranslationFile(DEFAULT_LOCALE), throwsFlutterError);
    });

    testWidgets('locale not supported, FlutterError while reading file', (tester) async {
      //need to use test widgets so that file can be loaded
      // arrange
      final TranslationFileRepositoryImpl repository = TranslationFileRepositoryImpl(TRANSLATION_FILES_PATH);
      // act
      // assert
      expect(repository.loadTranslationFile(const Locale("roki", "kreso")), throwsFlutterError);
    });

    testWidgets('read default locale, return non empty map', (tester) async {
      //need to use test widgets so that file can be loaded
      // arrange
      final TranslationFileRepositoryImpl repository = TranslationFileRepositoryImpl(TRANSLATION_FILES_PATH);
      // act
      Map defaultTranslations = await repository.loadTranslationFile(DEFAULT_LOCALE);
      // assert
      expect(defaultTranslations.isNotEmpty, true);
    });
  });
}
