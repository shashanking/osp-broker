import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle get title => TextStyle(
        fontFamily: 'Basement Grotesque',
        fontWeight: FontWeight.w800,
        fontSize: 32,
        color: AppColors.dark,
      );

  static TextStyle get buttonText => TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: AppColors.buttonText,
      );

  static TextStyle get heroHeadline => TextStyle(
        fontFamily: 'Basement Grotesque',
        fontWeight: FontWeight.w800,
        fontSize: 64,
        height: 1.2,
        color: AppColors.headingDark,
      );

  static TextStyle get heroSubtitle => TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        fontSize: 20,
        height: 1.5,
        color: AppColors.dark,
      );

  static TextStyle get heroButton => TextStyle(
        fontFamily: 'Basement Grotesque',
        fontWeight: FontWeight.w800,
        fontSize: 20,
        color: AppColors.buttonText,
      );

  static TextStyle get welcomePill => TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColors.menuText,
      );
  static TextStyle get heading40 => TextStyle(
        fontFamily: 'Basement Grotesque',
        fontWeight: FontWeight.w800,
        fontSize: 40,
        height: 54 / 40,
        color: AppColors.light,
      );
  static TextStyle get heading40Blue =>
      heading40.copyWith(color: AppColors.headingBlue);
  static TextStyle get heading40Dark =>
      heading40.copyWith(color: AppColors.headingDark);

  static TextStyle get menuTitle => TextStyle(
        fontFamily: 'Basement Grotesque',
        fontWeight: FontWeight.w800,
        fontSize: 32,
        color: AppColors.light,
      );
  static TextStyle get menuItem => TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColors.menuText,
      );
  static TextStyle get infoItem => TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: AppColors.light,
        height: 1.5,
      );
  static TextStyle get copyright => TextStyle(
        fontFamily: 'Nunito Sans',
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: AppColors.copyright,
        height: 1.5,
      );
  static TextStyle get inputHint => TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        fontSize: 24,
        color: AppColors.inputHint,
      );
  static TextStyle get sendButton => TextStyle(
        fontFamily: 'Basement Grotesque',
        fontWeight: FontWeight.w800,
        fontSize: 20,
        color: AppColors.dark,
      );
  static TextStyle get aboutText => TextStyle(
        fontFamily: 'Nunito Sans',
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: AppColors.light,
        height: 1.5,
      );
}
