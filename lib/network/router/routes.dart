// All Flutter Built-in Imports Here.
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

    GoRoute(
      name: AppRoute.createEmployee,
      path: '/create_employee',
      builder: (context, state) {
        return const CreateEmployeeView();
      },
    ),

    /// This is main entry point route.
    GoRoute(
      name: AppRoute.empDetails,
      path: '/emp_details',
      builder: (context, state) {
        Map<String, dynamic> extra = state.extra as Map<String, dynamic>;
        return EmployeeDetailsView(employee: extra['employee']);
      },
    ),
  ],
  errorPageBuilder: (context, state) {
    return const MaterialPage(child: HomeView());
  },
);
