import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1080.h,
      decoration: BoxDecoration(
        color: const Color(0xFFEBE6DC),
        image: DecorationImage(
          image: AssetImage('assets/images/landing-bg3.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left: Banner Image
            SizedBox(
              width: 820.w,
              height: 900.h,
              child: Image.asset(
                'assets/images/landing-banner3.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 80.w),
            // Right: Text Content
            SizedBox(
              width: 820.w,
              height: 900.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Redefining Auctions ',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w800,
                            fontSize: 48.sp,
                            color: const Color(0xFFD59823),
                          ),
                        ),
                        TextSpan(
                          text: '& Community Engagement',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w800,
                            fontSize: 48.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),
                  // Subtitle
                  Text(
                    'Connecting buyers, sellers, and industry professionals through a powerful marketplace, interactive forums, and exclusive membership perks—built for seamless transactions and meaningful connections.',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontSize: 22.sp,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: 48.h),
                  // Button
                  SizedBox(
                    width: 180.w,
                    height: 54.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF24439B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: Text(
                        'Learn More',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 22.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
