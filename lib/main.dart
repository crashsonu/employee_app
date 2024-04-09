// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.
import 'package:flutter_bloc/flutter_bloc.dart';

// All Native Imports Here.
import 'package:employee_app/constants/theme.dart';
import 'package:employee_app/network/router/routes.dart';
import 'package:employee_app/views/blocs/employee/cubits.dart';

// All Attributes or Constants Here.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeesCubit(),
      child: MaterialApp.router(
        title: 'Employee App',
        theme: appTheme(context),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
