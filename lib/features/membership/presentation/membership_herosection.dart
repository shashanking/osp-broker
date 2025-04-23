import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../home/presentation/widgets/navbar.dart';

class MembershipPage extends StatelessWidget {
  const MembershipPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBE6DC),
      body: SafeArea(
        child: Column(
          children: [
            // Navbar at the top
            const AppNavBar(),
            Expanded(
              child: Center(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 54.w, vertical: 54.h),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32.r),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.r),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 36, 68, 155),
                            Color.fromARGB(255, 21, 165, 205),
                          ],
                        ),
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/images/membership_hero_banner.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 48.w, top: 64.h, bottom: 64.h),
                        child: Row(
                          children: [
                            // Left side: Texts
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Choose the ',
                                          style: TextStyle(
                                            fontFamily: 'Basement Grotesque',
                                            fontWeight: FontWeight.w800,
                                            fontSize: 48.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Perfect ',
                                          style: TextStyle(
                                            fontFamily: 'Basement Grotesque',
                                            fontWeight: FontWeight.w800,
                                            fontSize: 48.sp,
                                            color: const Color(0xFFF5B12D),
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Membership for You',
                                          style: TextStyle(
                                            fontFamily: 'Basement Grotesque',
                                            fontWeight: FontWeight.w800,
                                            fontSize: 48.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 24.h),
                                  Text(
                                    'Unlock exclusive features and benefits tailored to your needs. Whether you\'re here to engage in forums, bid on auctions, or access premium services, our membership plans offer the right level of access for you. Upgrade anytime and maximize your experience!',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 32.h),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFF5B12D),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.r),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 32.w, vertical: 12.h),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'Shop Now!',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 32.h),
                                ],
                              ),
                            ),
                            // Right side: Circular image and membership cards
                            Expanded(
                              flex: 6,
                              child: Center(
                                child: SizedBox(
                                  width: 600.w,
                                  height: 600.w,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      // Circular background
                                      Image.asset(
                                        'assets/images/membership_hero_circular.png',
                                        width: 600.w,
                                        height: 600.w,
                                        fit: BoxFit.contain,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MembershipCard extends StatelessWidget {
  final String title;
  final String price;
  final String priceLabel;
  final String description;
  final Color color;
  final bool highlight;

  const _MembershipCard({
    required this.title,
    required this.price,
    required this.priceLabel,
    required this.description,
    required this.color,
    required this.highlight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      height: 320.h,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: highlight
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.18),
                  blurRadius: 28,
                  offset: const Offset(0, 10),
                ),
              ]
            : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Basement Grotesque',
                  fontWeight: FontWeight.w800,
                  fontSize: 24.sp,
                  color: Colors.white,
                ),
              ),
              if (price != '\u0000')
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: price,
                        style: TextStyle(
                          fontFamily: 'Basement Grotesque',
                          fontWeight: FontWeight.w800,
                          fontSize: 32.sp,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: priceLabel,
                        style: TextStyle(
                          fontFamily: 'Basement Grotesque',
                          fontWeight: FontWeight.w800,
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            description,
            style: TextStyle(
              color: Colors.white.withOpacity(0.92),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          if (highlight)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF5B12D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              ),
              onPressed: () {},
              child: Text(
                'Start Now!',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
