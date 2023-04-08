import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: tSecondaryColor,
    labelStyle: TextStyle(
      color: tSecondaryColor,
    ),
    floatingLabelStyle: TextStyle(
      color: tSecondaryColor,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 5, color: tSecondaryColor),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: tPrimaryColor,
    floatingLabelStyle: TextStyle(
      color: tPrimaryColor,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 5, color: tPrimaryColor),
    ),
  );
}
