// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.

// All Native Imports Here.
import 'package:employee_app/utils/responsive.dart';
import 'package:employee_app/views/home/mobile/view.dart';
import 'package:employee_app/views/home/desktop/view.dart';

// All Attributes or Constants Here.

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: MobileHomeView(),
        landscape: MobileHomeView(),
      ),
      desktop: OrientationLayout(
        portrait: DesktopHomeView(),
        landscape: DesktopHomeView(),
      ),
      tablet: OrientationLayout(
        portrait: DesktopHomeView(),
        landscape: DesktopHomeView(),
      ),
    );
  }
}
