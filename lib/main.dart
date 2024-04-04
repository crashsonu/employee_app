// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.

// All Native Imports Here.
import 'package:employee_app/constants/theme.dart';
import 'package:employee_app/views/home/view.dart';

// All Attributes or Constants Here.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee App',
      theme: appTheme(context),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
