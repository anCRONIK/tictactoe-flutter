import 'package:flutter/material.dart';

const EdgeInsetsGeometry defaultScreenPadding = EdgeInsets.fromLTRB(12, 8, 12, 8);

class AppTextStyle {
  AppTextStyle._();

  static const String fontName = 'Roboto';

  static const TextTheme textTheme = TextTheme(
      headline4: display1,
      headline5: headline,
      headline6: title,
      subtitle2: subtitle,
      bodyText2: body2,
      bodyText1: body1,
      caption: caption,
      button: button);

  static const TextStyle display1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
  );

  static const TextStyle body1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
  );

  static const TextStyle button = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
  );
}

class AppButtonStyle {
  AppButtonStyle._();
}

class AppThemeTemplates {
  AppThemeTemplates._();

  static ThemeData get lightTheme {
    return ThemeData.from(textTheme: AppTextStyle.textTheme, colorScheme: _lightColorScheme);
  }

  static ThemeData get darkTheme {
    return ThemeData.from(textTheme: AppTextStyle.textTheme, colorScheme: _darkColorScheme);
  }

  static const ColorScheme _darkColorScheme = ColorScheme.dark(
      primary: Color(0xFF777A7E), primaryVariant: Color(0xFF919396), secondary: Color(0xFFFCB075), secondaryVariant: Color(0xFFEFB383));

  static const ColorScheme _lightColorScheme = ColorScheme.light(
      primary: Color(0xFF1D2228), primaryVariant: Color(0xFF484C50), secondary: Color(0xFFFB8122), secondaryVariant: Color(0xFFEA9654));
}
