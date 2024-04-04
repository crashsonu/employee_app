// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.

// All Native Imports Here.
import 'package:employee_app/constants/colors.dart';
import 'package:employee_app/constants/texts.dart';

// All Attributes or Constants Here.

/// Returns a scaffold message.
void showScaffoldMessage(BuildContext context, String msg,
    {Color? color, bool? isDesktop}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color ?? AppColors.primaryColor,
      content: SizedBox(
        child: isDesktop == true
            ? AppText(text: msg, color: Colors.white)
            : AppText(text: msg, color: Colors.white),
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}
