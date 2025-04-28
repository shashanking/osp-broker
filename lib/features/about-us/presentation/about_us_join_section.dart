import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsJoinSection extends StatelessWidget {
  const AboutUsJoinSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 824.h,
      decoration: BoxDecoration(
        color: const Color(0xFFEBE6DC),
        // image: DecorationImage(
        //   image: AssetImage('assets/images/about-page-join-bg.png'),
        //   fit: BoxFit.cover,
        //   opacity: 0.3,
        // ),
      ),
      child: Center(
        child: Stack(
          children: [
            // Banner blue gradient background
            Positioned(
              left: 0,
              right: 0,
              top: 0.1.sh,
              child: Container(
                width: 1.sw,
                height: 530.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/about-page-join-bg.png'),
                    fit: BoxFit.cover,
                    opacity: 0.3,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF24439B), Color(0xFF15A5CD)],
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 859.w,
                        height: 300.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Join Us Today',
                              style: TextStyle(
                                fontFamily: 'Basement Grotesque',
                                fontWeight: FontWeight.w800,
                                fontSize: 64.sp,
                                height: 1.2,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 32.h),
                            Text(
                              'Be part of a thriving marketplace where opportunities are endless. Sign up today and take your auctions, discussions, and business collaborations to the next level!',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                fontSize: 20.sp,
                                height: 1.5,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 48.h),
                            Container(
                              width: 859.w,
                              height: 83.h,
                              padding: EdgeInsets.symmetric(horizontal: 12.w)
                                  .copyWith(left: 32.w, right: 12.w),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFDFDFD),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.08),
                                    offset: const Offset(2, 2),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(56.r),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Enter Email ID',
                                        hintStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 24.sp,
                                          color: const Color(0xFF636E72),
                                        ),
                                      ),
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 24.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Container(
                                    width: 180.w,
                                    height: 60.h,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xFFECC733),
                                          Color(0xFFD49823)
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius:
                                            BorderRadius.circular(50.r),
                                        onTap: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Send',
                                              style: TextStyle(
                                                fontFamily:
                                                    'Basement Grotesque',
                                                fontWeight: FontWeight.w800,
                                                fontSize: 20.sp,
                                                color: const Color(0xFF333333),
                                              ),
                                            ),
                                            SizedBox(width: 10.w),
                                            Image.asset(
                                              'assets/icons/about-page-join-icon.png',
                                              width: 20.w,
                                              height: 20.w,
                                            ),
                                          ],
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
                      Image.asset(
                        'assets/icons/about-page-join-icon.png',
                        width: 757.33.w,
                        height: 568.h,
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
    );
  }
}
