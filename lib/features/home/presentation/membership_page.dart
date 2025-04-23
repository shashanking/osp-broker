import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MembershipSection extends StatelessWidget {
  const MembershipSection({super.key});

  @override
  Widget build(BuildContext context) {
    final memberships = [
      {
        'icon': 'assets/icons/membership/free.png',
        'title': 'Free',
        'price': '0',
        'priceLabel': '/month',
        'titleColor': Color(0xFFF2F2F2),
        'bgGradient': LinearGradient(
          colors: [
            Color(0xFF000000).withOpacity(0.1),
            Color(0xFF999999).withOpacity(0.1)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        'desc':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit Integer.',
        'features': [
          'Post in limited sections.',
          'Access basic forums and threads',
        ],
      },
      {
        'icon': 'assets/icons/membership/bronze.png',
        'title': 'Bronze',
        'price': '49',
        'priceLabel': '/month',
        'titleColor': Color(0xFFF2F2F2),
        'bgGradient': LinearGradient(
          colors: [
            Color(0xFFF09C2D).withOpacity(0.1),
            Color(0xFF999999).withOpacity(0.1)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        'desc':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit Integer.',
        'features': [
          'Post in limited sections.',
          'Access basic forums and threads',
          'Ability to create profiles with skills, resumes, and experience.',
        ],
      },
      {
        'icon': 'assets/icons/membership/silver.png',
        'title': 'Silver',
        'price': '79',
        'priceLabel': '/month',
        'titleColor': Color(0xFFF2F2F2),
        'bgGradient': LinearGradient(
          colors: [
            Color(0xFFFFFFFF).withOpacity(0.2),
            Color(0xFF999999).withOpacity(0.2)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        'desc':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit Integer.',
        'features': [
          'Post in limited sections.',
          'Access basic forums and threads',
          'Ability to create profiles with skills, resumes, and experience.',
          'Reduced restrictions on posting and increased access to forums.',
        ],
      },
      {
        'icon': 'assets/icons/membership/gold.png',
        'title': 'Gold',
        'price': '99',
        'priceLabel': '/month',
        'titleColor': Color(0xFFD59823),
        'bgGradient': LinearGradient(
          colors: [
            Color(0xFFF8DC0E).withOpacity(0.1),
            Color(0xFFFB8500).withOpacity(0.1)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        'desc':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit Integer.',
        'features': [
          'Post in limited sections.',
          'Access basic forums and threads',
          'Ability to create profiles with skills, resumes, and experience.',
          'Ability to post classified ads and bid on projects.',
        ],
      },
      {
        'icon': 'assets/icons/membership/platinum.png',
        'title': 'Platinum',
        'price': '99',
        'priceLabel': '/month',
        'titleColor': Color(0xFF25B4DC),
        'bgGradient': LinearGradient(
          colors: [
            Color(0xFF70F3B1).withOpacity(0.2),
            Color(0xFF3F9BB5).withOpacity(0.2)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        'desc':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit Integer.',
        'features': [
          'Post in limited sections.',
          'Access basic forums and threads',
          'Ability to create profiles with skills, resumes, and experience.',
          'Ability to post classified ads and bid on projects.',
          'Ability to post ads for Statements of Work (SOW), equipment, and other categories.',
        ],
      },
      {
        'icon': 'assets/icons/membership/diamond.png',
        'title': 'Diamond',
        'price': '149',
        'priceLabel': '/month',
        'titleColor': Color(0xFF6DD8E4),
        'bgGradient': LinearGradient(
          colors: [
            Color(0xFF24439B).withOpacity(0.5),
            Color(0xFF15A5CD).withOpacity(0.5)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        'desc':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit Integer.',
        'features': [
          'Post in limited sections.',
          'Access basic forums and threads',
          'Ability to create profiles with skills, resumes, and experience.',
          'Ability to post classified ads and bid on projects.',
          'Ability to post ads for Statements of Work (SOW), equipment, and other categories.',
          'Additional services: consulting, marketing, recruiting, and strategic partnerships.',
        ],
      },
    ];

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF333333),
      ),
      child: Stack(
        children: [
          // Section Content
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/membership-sec-bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 100.h),
            child: Column(
              children: [
                // Header
                SizedBox(
                  width: 1126.w,
                  child: Column(
                    children: [
                      Text(
                        'Tiered Membership for Every Need',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Basement Grotesque',
                          fontWeight: FontWeight.w800,
                          fontSize: 40.sp,
                          color: const Color(0xFFF2F2F2),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        'Choose from Free, Bronze, Silver, Gold, Platinum, or Diamond plans and unlock progressively richer features—from basic forum access to full-scale auction creation and enterprise-level strategic partnerships.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          fontSize: 20.sp,
                          color: const Color(0xFFEBE6DC),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60.h),
                // Membership Cards Grid
                Center(
                  child: Wrap(
                    spacing: 47.w,
                    runSpacing: 48.h,
                    children: memberships.map((m) {
                      return _MembershipCard(data: m);
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MembershipCard extends StatelessWidget {
  final Map<String, dynamic> data;
  const _MembershipCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 515.w,
      constraints: BoxConstraints(minHeight: 600.h),
      margin: EdgeInsets.zero,
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
      decoration: BoxDecoration(
        gradient: data['bgGradient'],
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 24.r,
            offset: Offset(0, 8.h),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          //title and desc in column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row: Icon + Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 90.w,
                    height: 90.w,
                    child: Image.asset(data['icon'], fit: BoxFit.contain),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: data['price'] == '\u0000'
                              ? ''
                              : '\$${data['price']}',
                          style: TextStyle(
                            fontFamily: 'Basement Grotesque',
                            fontWeight: FontWeight.w800,
                            fontSize: 36.sp,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: data['priceLabel'],
                          style: TextStyle(
                            fontFamily: 'Basement Grotesque',
                            fontWeight: FontWeight.w800,
                            fontSize: 20.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Text(
                data['title'],
                style: TextStyle(
                  fontFamily: 'Basement Grotesque',
                  fontWeight: FontWeight.w800,
                  fontSize: 36.sp,
                  color: data['titleColor'],
                ),
              ),
              SizedBox(height: 12.h),
              // Description
              Text(
                data['desc'],
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: const Color(0xFFEBE6DC),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          // Features
          ...List.generate(
            (data['features'] as List).length,
            (i) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  Expanded(
                    child: Text(
                      data['features'][i],
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 32.h),
          // Button
          SizedBox(
            width: double.infinity,
            height: 60.h,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFECC733), Color(0xFFD49823)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  elevation: 0,
                  foregroundColor: const Color(0xFF333333),
                  textStyle: TextStyle(
                    fontFamily: 'Basement Grotesque',
                    fontWeight: FontWeight.w800,
                    fontSize: 20.sp,
                  ),
                ),
                onPressed: () {},
                child: const Text('Start Now!'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
