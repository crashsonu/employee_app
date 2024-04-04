// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.

// All Native Imports Here.

// All Attributes or Constants Here.

class AppText extends StatelessWidget {
  final String text;
  final bool bold;
  final Color color;
  final double textSize;
  final double? lineHeight;
  final FontWeight? fontWeight;
  final TextOverflow overflow;
  final TextStyle? textStyle;

  const AppText({
    super.key,
    required this.text,
    this.bold = false,
    this.color = Colors.black,
    this.textSize = 14,
    this.fontWeight,
    this.lineHeight,
    this.overflow = TextOverflow.clip,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: textStyle ??
          TextStyle(
              fontWeight:
                  bold ? fontWeight ?? FontWeight.w700 : FontWeight.w600,
              fontSize: textSize,
              color: color,
              letterSpacing: bold
                  ? fontWeight != null
                      ? 1.2
                      : 0.5
                  : 0.3,
              height: lineHeight ?? 1.3),
    );
  }
}
