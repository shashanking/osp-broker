import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MembershipCardSection extends StatelessWidget {
  const MembershipCardSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 70.w),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/membership_cardbg.png'),
          fit: BoxFit.cover,
        ),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFEBE6DC),
            Color(0xFFEBE6DC),
            Color(0x00EBE6DC),
            Color(0x00EBE6DC),
            Color(0xFFEBE6DC),
          ],
          stops: [0.0, 0.09, 0.25, 0.75, 1.0],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Tiered Membership for Every Need',
            style: TextStyle(
              fontFamily: 'Basement Grotesque',
              fontWeight: FontWeight.w800,
              fontSize: 32.sp,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          Text(
            'Choose from Free, Bronze, Silver, Gold, Platinum, or Diamond plans and unlock progressively richer features—\nfrom basic forum access to full-scale auction creation and enterprise-level strategic partnerships.',
            style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 36.h),
          LayoutBuilder(
            builder: (context, constraints) {
              final cardWidth = (constraints.maxWidth - 80.w) / 3;
              return Center(
                child: SizedBox(
                  width: cardWidth * 3 + 100.w,
                  child: GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 24.w,
                    mainAxisSpacing: 32.h,
                    childAspectRatio: cardWidth / 550.h,
                    children: [
                      _buildMembershipCard(
                        context,
                        title: 'Free',
                        price: '\u0000',
                        priceLabel: '\u0000',
                        badge: _Badge.free(),
                        features: const [
                          'Post in limited sections.',
                          'Access basic forums and threads.',
                        ],
                        btnColor: Color(0xFFE0E0E0),
                        highlight: false,
                        cost: '\u0000',
                        costLabel: '\u0000',
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(0, 0, 0, 0.1),
                            Color.fromRGBO(153, 153, 153, 0.1),
                          ],
                        ),
                      ),
                      _buildMembershipCard(
                        context,
                        title: 'Bronze',
                        price: '\u0000',
                        priceLabel: '\u0000',
                        badge: _Badge.bronze(),
                        features: const [
                          'Post in limited sections.',
                          'Access basic forums and threads.',
                          'Ability to create profiles with skills, resumes, and experience.',
                        ],
                        btnColor: Color(0xFFFFF3E0),
                        highlight: false,
                        cost: '\u0000',
                        costLabel: '\u0000',
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(240, 156, 45, 0.1),
                            Color.fromRGBO(153, 153, 153, 0.1),
                          ],
                        ),
                      ),
                      _buildMembershipCard(
                        context,
                        title: 'Silver',
                        price: '\u0000',
                        priceLabel: '\u0000',
                        badge: _Badge.silver(),
                        features: const [
                          'Post in limited sections.',
                          'Access basic forums and threads.',
                          'Ability to create profiles with skills, resumes, and experience.',
                          'Bid on auctions.',
                        ],
                        btnColor: Color(0xFFE0E0E0),
                        highlight: false,
                        cost: '\u0000',
                        costLabel: '\u0000',
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(255, 255, 255, 0.2),
                            Color.fromRGBO(153, 153, 153, 0.2),
                          ],
                        ),
                      ),
                      _buildMembershipCard(
                        context,
                        title: 'Gold',
                        price: '\u0000',
                        priceLabel: '\u0000',
                        badge: _Badge.gold(),
                        features: const [
                          'Post in limited sections.',
                          'Access basic forums and threads.',
                          'Ability to create profiles with skills, resumes, and experience.',
                          'Bid on auctions.',
                          'Create auctions.',
                        ],
                        btnColor: Color(0xFFE0E0E0),
                        highlight: false,
                        cost: '\u0000',
                        costLabel: '\u0000',
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(248, 220, 14, 0.1),
                            Color.fromRGBO(251, 133, 0, 0.1),
                          ],
                        ),
                      ),
                      _buildMembershipCard(
                        context,
                        title: 'Platinum',
                        price: '\u0000',
                        priceLabel: '\u0000',
                        badge: _Badge.platinum(),
                        features: const [
                          'Post in limited sections.',
                          'Access basic forums and threads.',
                          'Ability to create profiles with skills, resumes, and experience.',
                          'Bid on auctions.',
                          'Create auctions.',
                          'Access premium support.',
                        ],
                        btnColor: Color(0xFFE0E0E0),
                        highlight: false,
                        cost: '\u0000',
                        costLabel: '\u0000',
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(112, 243, 177, 0.2),
                            Color.fromRGBO(63, 155, 181, 0.2),
                          ],
                        ),
                      ),
                      _buildMembershipCard(
                        context,
                        title: 'Diamond',
                        price: '\u0000',
                        priceLabel: '\u0000',
                        badge: _Badge.diamond(),
                        features: const [
                          'Post in limited sections.',
                          'Access basic forums and threads.',
                          'Ability to create profiles with skills, resumes, and experience.',
                          'Bid on auctions.',
                          'Create auctions.',
                          'Access premium support.',
                          'Enterprise-level strategic partnerships.',
                        ],
                        btnColor: Color(0xFFE0E0E0),
                        highlight: false,
                        cost: '\u0000',
                        costLabel: '\u0000',
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(36, 67, 155, 0.5),
                            Color.fromRGBO(21, 165, 205, 0.5),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildMembershipCard(
  BuildContext context, {
  required String title,
  required String price,
  required String priceLabel,
  required Widget badge,
  required List<String> features,
  required Color btnColor,
  required bool highlight,
  String? cost,
  String? costLabel,
  Gradient? gradient,
}) {
  return Container(
    width: 515.w,
    constraints: BoxConstraints(minHeight: 715.h, maxWidth: 515.w),
    margin: EdgeInsets.symmetric(vertical: 6.h),
    padding: EdgeInsets.all(24.w),
    decoration: BoxDecoration(
      gradient: gradient,
      color: gradient == null ? Colors.white : null,
      borderRadius: BorderRadius.circular(32.r),
      border: Border.all(color: Colors.black.withOpacity(0.05), width: 1),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 16,
          offset: const Offset(0, 4),
        ),
      ],
      image: const DecorationImage(
        image: AssetImage('assets/images/membership_cardbg.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                badge,
                const SizedBox(width: 8),
                Expanded(child: Container()),
                if (title == 'Free')
                  Text(
                    '\u0000',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                      color: Colors.black,
                    ),
                  )
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _getPrice(title),
                        style: TextStyle(
                          fontFamily: 'Basement Grotesque',
                          fontWeight: FontWeight.w800,
                          fontSize: 28.sp,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '/month',
                        style: TextStyle(
                          fontFamily: 'Basement Grotesque',
                          fontWeight: FontWeight.w800,
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Basement Grotesque',
                fontWeight: FontWeight.w800,
                fontSize: 22.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit Integer.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 8.h),
            ...features.map((f) => Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('• ', style: TextStyle(color: Colors.black)),
                      Flexible(
                        fit: FlexFit.loose,
                        child: Text(
                          f,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFECC733),
                  Color(0xFFD49823),
                ],
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 12.h),
              ),
              onPressed: () {},
              child: const Text(
                'Start Now!',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

String _getPrice(String title) {
  switch (title) {
    case 'Free':
      return ' ';
    case 'Bronze':
      return ' \$49';
    case 'Silver':
      return ' \$79';
    case 'Gold':
      return ' \$99';
    case 'Platinum':
      return ' \$99';
    case 'Diamond':
      return ' \$149';
    default:
      return '';
  }
}

class _Badge extends StatelessWidget {
  final Widget icon;
  final Color color;
  final String label;
  const _Badge(
      {required this.icon, required this.color, required this.label, Key? key})
      : super(key: key);

  factory _Badge.free() => _Badge(
      icon: Image.asset(
        'assets/icons/membership/free.png',
        width: 68,
        height: 68,
        fit: BoxFit.contain,
      ),
      color: Colors.black,
      label: 'FREE');
  factory _Badge.bronze() => _Badge(
      icon: Image.asset(
        'assets/icons/membership/bronze.png',
        width: 68,
        height: 68,
        fit: BoxFit.contain,
      ),
      color: Color(0xFFB87333),
      label: '');
  factory _Badge.silver() => _Badge(
      icon: Image.asset(
        'assets/icons/membership/silver.png',
        width: 68,
        height: 68,
        fit: BoxFit.contain,
      ),
      color: Color(0xFFC0C0C0),
      label: '');
  factory _Badge.gold() => _Badge(
      icon: Image.asset(
        'assets/icons/membership/gold.png',
        width: 68,
        height: 68,
        fit: BoxFit.contain,
      ),
      color: Color(0xFFFFD700),
      label: '');
  factory _Badge.platinum() => _Badge(
      icon: Image.asset(
        'assets/icons/membership/platinum.png',
        width: 68,
        height: 68,
        fit: BoxFit.contain,
      ),
      color: Color(0xFFB2EBF2),
      label: '');
  factory _Badge.diamond() => _Badge(
      icon: Image.asset(
        'assets/icons/membership/diamond.png',
        width: 68,
        height: 68,
        fit: BoxFit.contain,
      ),
      color: Color(0xFF40C4FF),
      label: '');

  @override
  Widget build(BuildContext context) {
    return label.isNotEmpty
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          )
        : icon;
  }
}
