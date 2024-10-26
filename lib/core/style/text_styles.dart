import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle? title(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 22,
          letterSpacing: 2,
          color: Colors.black,
        );
  }

  static TextStyle? content(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 14,
          letterSpacing: 1,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
          height: 2,
        );
  }

  static TextStyle? buttonText(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 14,
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        );
  }
}
