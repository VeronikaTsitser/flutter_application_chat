import 'package:flutter/material.dart';
import 'package:flutter_application_chat/presentation/Theme/colors.dart';
import 'package:flutter_application_chat/presentation/Theme/text_theme.dart';

ThemeData basicTheme() => ThemeData(
    primaryColor: kPrimaryColor,
    textTheme: textTheme(),
    iconTheme: IconThemeData(
      color: kSecondaryColor,
    ),
    colorScheme: themeColor(),
    buttonTheme: ButtonThemeData(
        buttonColor: kSecondaryColor, textTheme: ButtonTextTheme.accent),
    cardTheme: CardTheme(
      color: kBackgroundColor,
    ));
