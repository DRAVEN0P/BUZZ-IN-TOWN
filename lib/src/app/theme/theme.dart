import 'package:flutter/material.dart';
import 'package:untitled/src/app/theme/app_color.dart';

final ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: AppColor.lightBackground,
  colorScheme: ColorScheme.light().copyWith(secondary: AppColor.secondary),
  appBarTheme: const AppBarTheme(
    surfaceTintColor: Colors.transparent,
    color: AppColor.lightBackground,
  ),
);
final ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: AppColor.darkBackground,
  appBarTheme: const AppBarTheme(
    color: AppColor.darkBackground,
  ),
);
