// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.

// All Native Imports Here.
import 'package:employee_app/utils/responsive.dart';
import 'package:employee_app/views/create_employee/mobile/view.dart';
import 'package:employee_app/views/create_employee/desktop/view.dart';

// All Attributes or Constants Here.

class CreateEmployeeView extends StatelessWidget {
  const CreateEmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: MobileCreateEmployeeView(),
        landscape: MobileCreateEmployeeView(),
      ),
      desktop: OrientationLayout(
        portrait: DesktopCreateEmployeeView(),
        landscape: DesktopCreateEmployeeView(),
      ),
      tablet: OrientationLayout(
        portrait: DesktopCreateEmployeeView(),
        landscape: DesktopCreateEmployeeView(),
      ),
    );
  }
}
