import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppGradients {
  static const LinearGradient verticalFooterBg = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.background,
      AppColors.background,
      Color(0x00EBE6DC),
      Color(0x00EBE6DC),
      AppColors.background,
    ],
    stops: [0.0, 0.09, 0.25, 0.75, 1.0],
  );

  static const LinearGradient blueButton = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.primary, AppColors.secondary],
  );

  static const LinearGradient orangeButton = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.accent, AppColors.accentDark],
  );

  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.accent, AppColors.accentDark],
  );

  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [AppColors.heroGradientStart, AppColors.heroGradientEnd],
  );

  static const LinearGradient welcomePillGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.primary, AppColors.secondary],
  );

  static const LinearGradient socialIcon = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.primary, AppColors.secondary],
  );
}
