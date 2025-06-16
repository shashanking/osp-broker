import 'package:flutter/material.dart';
import 'package:osp_broker/features/profile/domain/models/setting_model.dart';

const socialMediaData = [
  SocialMediaData(
    iconPath: 'assets/icons/logo_facebook.png',
    label: 'Facebook',
  ),
  SocialMediaData(
    iconPath: 'assets/icons/whatsapp.png',
    label: 'Whatsapp',
  ),
  SocialMediaData(
    iconPath: 'assets/icons/linkdin.png',
    label: 'Linkedin',
  ),
];

const settingsData = [
  SettingItemData(
    title: 'Update Profile Pic',
    description: 'Change or remove your display picture',
    actionType: SettingActionType.button,
    buttonLabel: 'Upload Image',
    icon: Icons.image,
  ),
  SettingItemData(
    title: 'Language',
    description: 'Default Language for website',
    actionType: SettingActionType.dropdown,
    dropdownValue: 'English',
  ),
  SettingItemData(
    title: 'Notifications',
    description: 'Allow notifications',
    actionType: SettingActionType.switch_,
    switchValue: false,
  ),
];

const linkedAccountsData = [
  LinkedAccountData(
    iconPath: 'assets/icons/logo_facebook.png',
    label: 'Facebook Account',
    actionLabel: 'Manage',
  ),
  LinkedAccountData(
    iconPath: 'assets/icons/whatsapp.png',
    label: 'Whatsapp',
    actionLabel: 'Manage',
  ),
  LinkedAccountData(
    iconPath: 'assets/icons/linkdin.png',
    label: 'Linkedin',
    actionLabel: 'Manage',
  ),
];
