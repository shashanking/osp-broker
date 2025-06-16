import 'package:flutter/material.dart';

enum SettingActionType { button, switch_, dropdown }

class SettingItemData {
  final String title;
  final String description;
  final SettingActionType actionType;
  final String? buttonLabel;
  final IconData? icon;
  final bool? switchValue;
  final String? dropdownValue;
  final String? dropdownIcon;

  const SettingItemData({
    required this.title,
    required this.description,
    required this.actionType,
    this.buttonLabel,
    this.icon,
    this.switchValue = false,
    this.dropdownValue,
    this.dropdownIcon,
  });
}

class LinkedAccountData {
  final String iconPath;
  final String label;
  final String actionLabel;

  const LinkedAccountData({
    required this.iconPath,
    required this.label,
    required this.actionLabel,
  });
}

class SocialMediaData {
  final String iconPath;
  final String label;

  const SocialMediaData({
    required this.iconPath,
    required this.label,
  });
}
