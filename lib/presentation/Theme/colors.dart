import 'package:flutter/material.dart';

const Color kPrimaryColor = Color.fromRGBO(0, 164, 128, 1);
const Color kSecondaryColor = Color.fromRGBO(255, 98, 0, 1);
const Color kBackgroundColor = Colors.white;
const Color kShadowColor = Color.fromRGBO(0, 164, 128, 0.1);

ColorScheme themeColor() => ColorScheme.fromSeed(
    seedColor: kPrimaryColor,
    background: kBackgroundColor,
    shadow: kShadowColor,
    secondary: kSecondaryColor,
    primary: kPrimaryColor);
