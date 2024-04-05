// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.

// All Native Imports Here.
import 'package:employee_app/models/employee.dart';
import 'package:employee_app/utils/responsive.dart';
import 'package:employee_app/views/update_employee/mobile/view.dart';
import 'package:employee_app/views/update_employee/desktop/view.dart';

// All Attributes or Constants Here.

class UpdateEmployeeView extends StatelessWidget {
  final EmployeeModel employee;

  const UpdateEmployeeView({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: MobileUpdateEmployeeView(employee: employee),
        landscape: MobileUpdateEmployeeView(employee: employee),
      ),
      desktop: OrientationLayout(
        portrait: DesktopUpdateEmployeeView(employee: employee),
        landscape: DesktopUpdateEmployeeView(employee: employee),
      ),
      tablet: OrientationLayout(
        portrait: DesktopUpdateEmployeeView(employee: employee),
        landscape: DesktopUpdateEmployeeView(employee: employee),
      ),
    );
  }
}
