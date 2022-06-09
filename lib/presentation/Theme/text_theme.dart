import 'package:flutter/material.dart';
import 'package:flutter_application_chat/presentation/Theme/colors.dart';

class AppFontName {}

const double largeTextSize = 26.0;
const double mediumTextSize = 20.0;
const double smallTextSize = 16.0;

const String fontNameDefault = 'Montserrat';

TextTheme textTheme() => const TextTheme(
      headline3: TextStyle(
        fontSize: largeTextSize,
        color: kPrimaryColor,
        fontFamily: fontNameDefault,
        fontWeight: FontWeight.w500,
      ),
      headline4: TextStyle(
        fontSize: mediumTextSize,
        color: kPrimaryColor,
        fontFamily: fontNameDefault,
      ),
      headline5: TextStyle(
        fontSize: smallTextSize,
        color: kPrimaryColor,
        fontFamily: fontNameDefault,
      ),
    );
