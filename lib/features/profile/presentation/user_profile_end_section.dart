import 'package:flutter/material.dart';
import 'package:osp_broker/features/profile/domain/models/setting_model.dart';
import 'package:osp_broker/features/profile/presentation/constants/profile_constants.dart';
import 'package:osp_broker/features/profile/presentation/widgets/profile/widgets.dart';

class UserProfileEndSection extends StatelessWidget {
  const UserProfileEndSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 40),
        SectionContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeading('Social Media'),
              const SizedBox(height: 20),
              Row(
                children: [
                  for (final item in socialMediaData)
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: GestureDetector(
                        onTap: () {
                          // TODO: Handle social media tap
                        },
                        child: Image.asset(
                          item.iconPath,
                          width: 36,
                          height: 36,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.error_outline,
                            size: 36,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        SectionContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeading('Settings'),
              const SizedBox(height: 18),
              ...settingsData.map((item) => _buildSettingItem(context, item)),
              const SizedBox(height: 18),
              const Text(
                'Linked Accounts',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 12),
              Column(
                children: [
                  for (final account in linkedAccountsData)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: LinkedAccountItem(
                        iconPath: account.iconPath,
                        label: account.label,
                        actionLabel: account.actionLabel,
                        onActionPressed: () {
                          // TODO: Handle account action
                        },
                      ),
                    ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 6),
                        child: SizedBox(
                          width: 225,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF24439B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              elevation: 0,
                            ),
                            onPressed: () {
                              // TODO: Handle add account
                            },
                            child: const Text(
                              '+Add Account',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildSettingItem(BuildContext context, SettingItemData item) {
    return SettingItem(
      title: item.title,
      description: item.description,
      type: item.actionType == SettingActionType.button
          ? SettingType.button
          : item.actionType == SettingActionType.switch_
              ? SettingType.switch_
              : SettingType.dropdown,
      value: item.switchValue ?? item.dropdownValue,
      icon: item.icon,
      onPressed: () {
        // Handle button press
      },
      onSwitchChanged: (value) {
        // Handle switch change
      },
      onDropdownChanged: (String? value) {
        // Handle dropdown change
      },
      items: item.actionType == SettingActionType.dropdown
          ? <String>['English', 'Spanish', 'French', 'German']
              .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList()
          : null,
    );
  }
}
