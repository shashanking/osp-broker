import 'package:flutter/material.dart';
import 'package:osp_broker/features/profile/domain/profile_model.dart';
import 'package:osp_broker/features/profile/presentation/widgets/profile/widgets.dart';



class UserProfileMidSection extends StatelessWidget {
  final UserProfile userProfile;

  const UserProfileMidSection({
    super.key,
    required this.userProfile,
  });

  // Generate user info list from user profile
  List<Map<String, String>> get _userInfo => [
        {'label': 'Name', 'value': userProfile.headLine},
        {'label': 'Location', 'value': userProfile.location},
        {'label': 'Email', 'value': '${userProfile.userId}@example.com'}, // Placeholder, update with actual email if available
      ];

  // Generate about section from user profile
  Map<String, String> get _about => {
        'heading': 'About',
        'desc': userProfile.about.isNotEmpty 
            ? userProfile.about 
            : 'No information available',
      };

  // Generate stats (placeholder - update with actual data when available)
  List<Map<String, String>> get _stats => [
        {'label': 'Posts', 'value': '0'},
        {'label': 'Following', 'value': '0'},
        {'label': 'Followers', 'value': '0'},
      ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 50),
        SectionContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SectionHeading('Info'),
              const SizedBox(height: 10),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  for (final item in _userInfo)
                    SizedBox(
                      width: 200, // Fixed width for better layout
                      child: InfoItem(
                        label: item['label']!,
                        value: item['value']!,
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SectionHeading(_about['heading']!),
              const SizedBox(height: 10),
              Text(
                _about['desc']!,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        SectionContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SectionHeading('Stats'),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (final stat in _stats)
                    StatsChip(
                      label: stat['label']!,
                      value: stat['value']!,
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
