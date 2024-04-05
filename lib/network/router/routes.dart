// All Flutter Built-in Imports Here.
import 'package:employee_app/views/splash/view.dart';
import 'package:employee_app/views/update_employee/view.dart';
import 'package:flutter/material.dart';

// All Custom Imports Here.
import 'package:go_router/go_router.dart';

// All Native Imports Here.
import 'package:employee_app/views/home/view.dart';
import 'package:employee_app/network/router/names.dart';
import 'package:employee_app/views/create_employee/view.dart';
import 'package:employee_app/views/employee_details/view.dart';

// All Attributes or Constants Here.

GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    /// This is main entry point route.
    GoRoute(
      name: AppRoute.splash,
      path: '/',
      builder: (context, state) {
        return const SplashView();
      },
    ),

    /// This is Home view route.
    GoRoute(
      name: AppRoute.home,
      path: '/home',
      builder: (context, state) {
        return const HomeView();
      },
    ),

    /// This is create employee view route.
    GoRoute(
      name: AppRoute.createEmployee,
      path: '/create',
      builder: (context, state) {
        return const CreateEmployeeView();
      },
    ),

    /// This is employee details view route.
    GoRoute(
      name: AppRoute.empDetails,
      path: '/details',
      builder: (context, state) {
        Map<String, dynamic> extra = state.extra as Map<String, dynamic>;
        return EmployeeDetailsView(employee: extra['employee']);
      },
    ),

    /// This is employee update view route.
    GoRoute(
      name: AppRoute.updateEmployee,
      path: '/update',
      builder: (context, state) {
        Map<String, dynamic> extra = state.extra as Map<String, dynamic>;
        return UpdateEmployeeView(employee: extra['employee']);
      },
    ),
  ],
  errorPageBuilder: (context, state) {
    return const MaterialPage(child: HomeView());
  },
);
