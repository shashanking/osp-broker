import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsMissionSection extends StatelessWidget {
  const AboutUsMissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFEBE6DC),
        image: DecorationImage(
          image: AssetImage('assets/images/about-us-page-sec2-bg.png'),
          fit: BoxFit.cover,
          opacity: 0.5,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 64.h, horizontal: 80.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left: Text and Button
            SizedBox(
              width: 672.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Our ',
                          style: TextStyle(
                            fontFamily: 'Basement Grotesque',
                            fontWeight: FontWeight.w800,
                            fontSize: 40.sp,
                            height: 54 / 40,
                            color: Color(0xFF121212),
                          ),
                        ),
                        TextSpan(
                          text: 'Mission',
                          style: TextStyle(
                            fontFamily: 'Basement Grotesque',
                            fontWeight: FontWeight.w800,
                            fontSize: 40.sp,
                            height: 54 / 40,
                            color: Color(0xFFD59823),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    "Our mission is to bridge the gap between buyers and sellers, fostering a trusted ecosystem where transparency, fairness, and innovation drive success. Whether you're looking to auction off valuable assets, bid on exclusive deals, or engage in insightful discussions, we provide the tools and features to make it happen.",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp,
                      height: 1.5,
                      color: Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: 60.h),
                  SizedBox(
                    width: 195.w,
                    height: 52.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF24439B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        elevation: 0,
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.w, vertical: 10.h),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Learn More',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                          height: 1.2,
                          color: Color(0xFFEBE6DC),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Right: Images and overlays
            SizedBox(
              height: 709.h,
              child: Stack(
                children: [
                  // Main image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24.r),
                    child: Image.asset(
                      'assets/images/about-us-page-sec2-img.png',
                      width: 810.w,
                      height: 709.h,
                      fit: BoxFit.cover,
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
