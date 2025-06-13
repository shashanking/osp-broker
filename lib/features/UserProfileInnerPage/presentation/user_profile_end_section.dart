import 'package:flutter/material.dart';

final socialMediaData = [
  {'icon': 'assets/icons/logo_facebook.png', 'label': 'Facebook'},
  {'icon': 'assets/icons/whatsapp.png', 'label': 'Whatsapp'},
  {'icon': 'assets/icons/linkdin.png', 'label': 'Linkedin'},
];

final settingsData = [
  {
    'title': 'Update Profile Pic',
    'desc': 'Change or remove your display picture',
    'actionType': 'button',
    'buttonLabel': 'Upload Image',
    'icon': Icons.image,
  },
  {
    'title': 'Language',
    'desc': 'Default Language for website',
    'actionType': 'dropdown',
    'dropdownValue': 'English',
    'dropdownIcon': '🇬🇧',
  },
  {
    'title': 'Notifications',
    'desc': 'Allow notifications',
    'actionType': 'switch',
    'switchValue': false,
  }
];

final linkedAccountsData = [
  {
    'icon': 'assets/icons/logo_facebook.png',
    'label': 'Facebook Account',
    'actionLabel': 'Manage',
  },
  {
    'icon': 'assets/icons/whatsapp.png',
    'label': 'Whatsapp',
    'actionLabel': 'Manage',
  },
  {
    'icon': 'assets/icons/linkdin.png',
    'label': 'Linkedin',
    'actionLabel': 'Manage',
  },
];

class UserProfileEndSection extends StatelessWidget {
  const UserProfileEndSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 40),
        _SectionContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _SectionHeading('Social Media'),
              const SizedBox(height: 20),
              Row(
                children: [
                  for (final item in socialMediaData)
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Image.asset(
                        item['icon']!,
                        width: 36,
                        height: 36,
                        fit: BoxFit.contain,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _SectionHeading('Settings'),
              const SizedBox(height: 18),
              ...settingsData.map((item) => _SettingsRow(item: item)).toList(),
              const SizedBox(height: 18),
              const Text('Linked Accounts', style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w700, fontSize: 20)),
              const SizedBox(height: 12),
              Column(
                children: [
                  for (final acc in linkedAccountsData)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: _LinkedAccountRow(item: acc),
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
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                elevation: 0,
                              ),
                              onPressed: () {},
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

class _SettingsRow extends StatelessWidget {
  final Map item;
  const _SettingsRow({required this.item});
  @override
  Widget build(BuildContext context) {
    Widget trailing;
    switch (item['actionType']) {
      case 'button':
        trailing = ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF232323),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            elevation: 0,
          ),
          onPressed: () {},
          icon: Icon(item['icon'], color: Colors.white, size: 22),
          label: Text(item['buttonLabel'], style: const TextStyle(fontFamily: 'Montserrat', fontSize: 18, color: Colors.white)),
        );
        break;
      case 'dropdown':
        trailing = Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF232323),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${item['dropdownIcon']}  ${item['dropdownValue']}', style: const TextStyle(fontFamily: 'Montserrat', color: Colors.white, fontSize: 18)),
              const SizedBox(width: 8),
              const Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ],
          ),
        );
        break;
      case 'switch':
        trailing = Switch(
          value: item['switchValue'],
          onChanged: (_) {},
          activeColor: const Color(0xFF232323),
        );
        break;
      default:
        trailing = const SizedBox();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['title'], style: const TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w700, fontSize: 18)),
                const SizedBox(height: 2),
                Text(item['desc'], style: const TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}

class _LinkedAccountRow extends StatelessWidget {
  final Map item;
  const _LinkedAccountRow({required this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xFFEBE6DC),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x66000000),
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(item['icon'], width: 28, height: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Text(item['label'], style: const TextStyle(fontFamily: 'Montserrat', fontSize: 18)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF232323),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              elevation: 0,
            ),
            onPressed: () {},
            child: Text(item['actionLabel'], style: const TextStyle(fontFamily: 'Montserrat', fontSize: 16, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
