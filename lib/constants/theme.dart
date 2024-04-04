// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.

// All Native Imports Here.
import 'package:employee_app/constants/colors.dart';

// All Attributes or Constants Here.
ThemeData appTheme(BuildContext context) {
  return ThemeData(
      primaryColor: AppColors.primaryColor,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      useMaterial3: true,
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.primaryColor,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
      ));
}
