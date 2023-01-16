import 'package:flutter/material.dart';

import 'colors.dart';

abstract class AppTheme {
  // static ThemeData get lightTheme => ThemeData(
  //   scaffoldBackgroundColor: Colors.white,
  //   textTheme: ThemeData.light().textTheme.copyWith(
  //     bodyText1: const TextStyle(
  //       fontSize: 25,
  //       color: Colors.black,
  //     ),
  //     caption: const TextStyle(
  //       fontStyle: FontStyle.italic,
  //       fontSize: 15,
  //       color: Colors.black,
  //     ),
  //   ),
  // );
  //
  // static ThemeData get darkTheme => ThemeData(
  //   scaffoldBackgroundColor: Colors.blueGrey.shade800,
  //   textTheme: ThemeData.dark().textTheme.copyWith(
  //     bodyText1: const TextStyle(
  //       fontSize: 25,
  //       color: Colors.white,
  //     ),
  //     caption: const TextStyle(
  //       fontStyle: FontStyle.italic,
  //       fontSize: 15,
  //       color: Colors.white,
  //     ),
  //   ),
  // );
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: whiteColor,
    primaryColor: PRIMARY_COLOR,
    primaryColorDark: PRIMARY_COLOR,
    errorColor: Colors.red,
    hoverColor: Colors.grey,
    dividerColor: viewLineColor,
    appBarTheme: AppBarTheme(
      color: appLayout_background,
      iconTheme: IconThemeData(color: textPrimaryColor),
    ),
    colorScheme: ColorScheme.light(
      primary: PRIMARY_COLOR,
      primaryVariant: PRIMARY_COLOR,
    ),
    cardTheme: CardTheme(color: Colors.white),
    iconTheme: IconThemeData(color: textPrimaryColor),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: whiteColor),
    textTheme: TextTheme(
      button: TextStyle(color: PRIMARY_COLOR),
      headline6: TextStyle(color: textPrimaryColor),
      subtitle2: TextStyle(color: textSecondaryColor),
    ),

  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: appBackgroundColorDark,
    highlightColor: appBackgroundColorDark,
    errorColor: Color(0xFFCF6676),
    appBarTheme: AppBarTheme(color: appBackgroundColorDark, iconTheme: IconThemeData(color: whiteColor)),
    primaryColor: color_primary_black,
    accentColor: whiteColor,
    dividerColor: Color(0xFFDADADA).withOpacity(0.3),
    primaryColorDark: color_primary_black,
    hoverColor: Colors.black,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: appBackgroundColorDark),
    primaryTextTheme: TextTheme(
      headline6: TextStyle(color: Colors.white),
      overline: TextStyle(color: Colors.white),
    ),
    colorScheme: ColorScheme.light(
      primary: appBackgroundColorDark,
      onPrimary: cardBackgroundBlackDark,
      primaryVariant: color_primary_black,
    ),
    cardTheme: CardTheme(color: cardBackgroundBlackDark),
    iconTheme: IconThemeData(color: whiteColor),
    textTheme: TextTheme(
      button: TextStyle(color: color_primary_black),
      headline6: TextStyle(color: whiteColor),
      subtitle2: TextStyle(color: Colors.white54),
    ),

  );
}