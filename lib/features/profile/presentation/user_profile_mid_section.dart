import 'package:flutter/material.dart';
import 'package:osp_broker/features/profile/application/profile_model.dart';

// Info item widget to display label and value
class _InfoItem extends StatelessWidget {
  final String label;
  final String value;

  const _InfoItem({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

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
        _SectionContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _SectionHeading('Info'),
              const SizedBox(height: 10),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  for (final item in _userInfo)
                    SizedBox(
                      width: 200, // Fixed width for better layout
                      child: _InfoItem(
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
        _SectionContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _SectionHeading(_about['heading']!),
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
        _SectionContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _SectionHeading('Stats'),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (final stat in _stats)
                    _StatsChip(
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

class _SectionContainer extends StatelessWidget {
  final Widget child;
  const _SectionContainer({required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Color(0xFFEBE6DC),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x66000000),
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _SectionHeading extends StatelessWidget {
  final String text;
  const _SectionHeading(this.text);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Basement Grotesque',
        fontWeight: FontWeight.w900,
        fontSize: 30,
        color: Color(0xFF232323),
      ),
    );
  }
}

class _StatsChip extends StatelessWidget {
  final String label;
  final String value;
  const _StatsChip({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF232323),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        '$label: $value',
        style: const TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
