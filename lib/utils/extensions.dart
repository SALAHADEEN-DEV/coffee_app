import 'package:flutter/material.dart';

extension CustomExtensions on BuildContext {
  ColorScheme get c => ColorScheme.of(this);
  TextTheme get tt => TextTheme.of(this);
}
