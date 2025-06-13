import 'package:flutter/material.dart';
import 'user_profile_end_section.dart';

// Data models
final userInfo = [
  {'label': 'Name', 'value': 'Sarah Davis'},
  {'label': 'Phone Number', 'value': '+1 758-895-4853'},
  {'label': 'Email ID', 'value': 'example@gmail.com'},
  {'label': 'Location', 'value': 'Lorem,Ipsum Nunc interdum'},
];

final inventory = [
  {'label': 'Kudo Coins', 'value': '540'},
  {'label': 'Gem Stones', 'value': '2,400'},
  {'label': 'Pins', 'value': '90'},
];

final about = {
  'heading': 'About',
  'bold': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  'desc': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc interdum egestas eleifend. Nulla est tortor, iaculis eu iaculis ut, congue at sapien. Mauris gravida congue vulputate. Suspendisse vitae magna at sem vehicula porttitor. Suspendisse eget pretium elit, ut dapibus massa. Sed vulputate dolor mattis, pretium lorem quis, ullamcorper justo.'
};

final stats = [
  {'label': 'Auctions', 'value': '12'},
  {'label': 'Bids', 'value': '20'},
  {'label': 'Won', 'value': '4'},
  {'label': 'Forum Post', 'value': '12'},
];

class UserProfileMidSection extends StatelessWidget {
  const UserProfileMidSection({super.key});

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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final item in userInfo)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['label']!, style: const TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w700, fontSize: 20)),
                            const SizedBox(height: 4),
                            Text(item['value']!, style: const TextStyle(fontFamily: 'Montserrat', fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF232323),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
                          elevation: 0,
                        ),
                        onPressed: () {},
                        child: const Text('Edit', style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white)),
                      ),
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
              Row(
                children: [
                  _SectionHeading('Inventory'),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF232323),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: const Text('See All', style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  for (final item in inventory)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['label']!, style: const TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w700, fontSize: 20)),
                            const SizedBox(height: 4),
                            Text(item['value']!, style: const TextStyle(fontFamily: 'Montserrat', fontSize: 20)),
                          ],
                        ),
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
              _SectionHeading(about['heading']!),
              const SizedBox(height: 10),
              Text(about['bold']!, style: const TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w700, fontSize: 20)),
              const SizedBox(height: 8),
              Text(about['desc']!, style: const TextStyle(fontFamily: 'Montserrat', fontSize: 20)),
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
                spacing: 16,
                runSpacing: 12,
                children: [
                  for (final item in stats)
                    _StatsChip(label: item['label']!, value: item['value']!),
                ],
              ),
            ],
          ),
        ),
        const UserProfileEndSection(),
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
