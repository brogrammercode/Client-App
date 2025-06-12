// ignore_for_file: deprecated_member_use

import 'package:adapp/core/config/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.red1,
    primaryColorLight: AppColors.red1,
    primaryColorDark: AppColors.red1,
    hintColor: AppColors.red1,
    scaffoldBackgroundColor: AppColors.black1,
    textTheme: GoogleFonts.ibmPlexSansTextTheme().apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.red1,
      textTheme: ButtonTextTheme.primary,
    ),
    appBarTheme: const AppBarTheme(
      surfaceTintColor: AppColors.black1,
      iconTheme: IconThemeData(color: Colors.white),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.red1,
      secondary: AppColors.black1,
      surface: AppColors.black1,
      error: AppColors.red1,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onError: Colors.black,
    ).copyWith(surface: AppColors.black1),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: const WidgetStatePropertyAll(15),
        shadowColor: WidgetStatePropertyAll(AppColors.red1.withOpacity(.4)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        ),
        iconColor: const WidgetStatePropertyAll(Colors.white),
        fixedSize: const WidgetStatePropertyAll(Size(350, 55)),
        textStyle: const WidgetStatePropertyAll(TextStyle(color: Colors.white)),
        backgroundColor: const WidgetStatePropertyAll(AppColors.red1),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        ),
        //
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
      },
    ),
  );
}
