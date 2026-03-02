import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // メインカラー
  static const Color pink = Color(0xFFEF97B0);
  static const Color blue = Color(0xFF5EC9F7);

  // グラデーション
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [pink, blue],
  );

  static const LinearGradient reverseGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [blue, pink],
  );
}
