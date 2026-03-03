import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // スライドデッキの背景・文字（統一）
  static const Color deckBackground = Color(0xFFFFFF66); // #FFFF66
  static const Color deckText = Color(0xFF222266); // #222266

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
