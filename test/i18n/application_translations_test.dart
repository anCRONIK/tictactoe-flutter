import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:tictactoe/i18n/application_translations.dart';
import 'package:tictactoe/i18n/constants.dart';

void main() {
  group('initTranslations', () {
    testWidgets('check if method loads and populates translations properly', (tester) async {
      //need to use test widgets so that file can be loaded
      // arrange
      // act
      final Translations translations = await initTranslations();
      // assert
      expect(translations.keys, isNotEmpty);
      expect(translations.keys[DEFAULT_LOCALE.toString()]!["app.title"], "SmartShoppingAssistant");
    });
  });
}
