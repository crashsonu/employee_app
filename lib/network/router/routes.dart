// All Flutter Built-in Imports Here.

import 'package:flutter/material.dart';

// All Custom Imports Here.
import 'package:go_router/go_router.dart';

// All Native Imports Here.
import 'package:employee_app/views/home/view.dart';
import 'package:employee_app/network/router/names.dart';
import 'package:employee_app/views/employee_details/view.dart';

// All Attributes or Constants Here.

GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: [
    /// This is main entry point route.
    GoRoute(
      name: AppRoute.home,
      path: '/home',
      builder: (context, state) {
        return const HomeView();
      },
    ),

    /// This is main entry point route.
    GoRoute(
      name: AppRoute.home,
      path: '/emp_details',
      builder: (context, state) {
        return const EmployeeDetailsView();
      },
    ),
  ],
  errorPageBuilder: (context, state) {
    return const MaterialPage(child: HomeView());
  },
);
