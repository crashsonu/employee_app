// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.

// All Native Imports Here.
import 'package:employee_app/models/employee.dart';
import 'package:employee_app/utils/responsive.dart';
import 'package:employee_app/views/employee_details/mobile/view.dart';
import 'package:employee_app/views/employee_details/desktop/view.dart';

// All Attributes or Constants Here.

class EmployeeDetailsView extends StatelessWidget {
  final EmployeeModel employee;

  const EmployeeDetailsView({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: MobileEmployeeDetailsView(employee: employee),
        landscape: MobileEmployeeDetailsView(employee: employee),
      ),
      desktop: OrientationLayout(
        portrait: DesktopEmployeeDetailsView(employee: employee),
        landscape: DesktopEmployeeDetailsView(employee: employee),
      ),
      tablet: OrientationLayout(
        portrait: DesktopEmployeeDetailsView(employee: employee),
        landscape: DesktopEmployeeDetailsView(employee: employee),
      ),
    );
  }
}
