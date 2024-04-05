// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.

// All Native Imports Here.

// All Attributes or Constants Here.

// Enum to represent different device screen types
enum DeviceScreenType {
  mobile,
  tablet,
  desktop,
}

/// A data class representing sizing information for responsive layouts.
class SizingInformation {
  final Orientation orientation;
  final DeviceScreenType deviceType;
  final Size screenSize;
  final Size localWidgetSize;

  const SizingInformation({
    required this.orientation,
    required this.deviceType,
    required this.screenSize,
    required this.localWidgetSize,
  });

  @override
  String toString() {
    return 'Orientation:$orientation DeviceType:$deviceType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
  }
}

/// A builder widget for creating responsive layouts based on the screen size and orientation.
class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;

  const ResponsiveBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(
      builder: (context, boxSizing) {
        var sizingInformation = SizingInformation(
          orientation: mediaQuery.orientation,
          deviceType: getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize: Size(boxSizing.maxWidth, boxSizing.maxHeight),
        );
        return builder(context, sizingInformation);
      },
    );
  }
}

/// Determines the device type based on the given media query.
DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  var orientation = mediaQuery.orientation;

  double deviceWidth = (orientation == Orientation.landscape)
      ? mediaQuery.size.height
      : mediaQuery.size.width;

  if (deviceWidth > 950) {
    return DeviceScreenType.desktop;
  }

  if (deviceWidth > 600) {
    return DeviceScreenType.tablet;
  }

  return DeviceScreenType.mobile;
}

/// A widget for displaying different layouts based on the screen orientation.
class OrientationLayout extends StatelessWidget {
  final Widget landscape;
  final Widget portrait;

  const OrientationLayout(
      {super.key, required this.landscape, required this.portrait});

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return (orientation == Orientation.landscape) ? landscape : portrait;
  }
}

/// A widget for displaying different layouts based on the device screen type.
class ScreenTypeLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ScreenTypeLayout(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.desktop});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // If sizing indicates Tablet and we have a tablet widget then return
        if (sizingInformation.deviceType == DeviceScreenType.tablet) {
          return tablet;
        }

        // If sizing indicates desktop and we have a desktop widget then return
        if (sizingInformation.deviceType == DeviceScreenType.desktop) {
          return desktop;
        }

        // Return mobile layout if nothing else is supplied
        return mobile;
      },
    );
  }
}
