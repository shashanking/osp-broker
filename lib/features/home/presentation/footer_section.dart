import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osp_broker/core/theme/app_colors.dart';
import 'package:osp_broker/core/theme/app_text_styles.dart';
import 'package:osp_broker/core/theme/app_gradients.dart';

class FooterSection extends StatelessWidget {
  const FooterSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1032.h,
      color: AppColors.background,
      child: Stack(
        children: [
          // Gradient overlay
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: AppGradients.verticalFooterBg,
              ),
            ),
          ),
          // Main footer card
          Positioned(
            left: (1.sw - 1824.w) / 2,
            bottom: 48.h,
            child: Container(
              width: 1824.w,
              height: 689.h,
              decoration: BoxDecoration(
                color: AppColors.dark,
                borderRadius: BorderRadius.circular(32.r),
              ),
              child: Stack(
                children: [
                  // Newsletter
                  Positioned(
                    left: 92.w,
                    top: 38.h,
                    child: SizedBox(
                      width: 1640.w,
                      height: 108.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 546.w,
                            child: Text.rich(
                              TextSpan(
                                text: 'Get the ',
                                style: TextStyle(
                                  fontFamily: 'Basement Grotesque',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 40.sp,
                                  height: 54 / 40,
                                  color: AppColors.light,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Latest Updates',
                                    style: TextStyle(
                                      color: Color(0xFF15A5CD),
                                    ),
                                  ),
                                  TextSpan(
                                    text: ',\nTips & Insights',
                                    style: TextStyle(
                                      color: Color(0xFFF2F2F2),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 78.w),
                          Expanded(
                            child: Container(
                              height: 83.h,
                              padding: EdgeInsets.only(left: 32.w, right: 12.w),
                              decoration: BoxDecoration(
                                color: AppColors.inputBg,
                                borderRadius: BorderRadius.circular(56.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.12),
                                    offset: Offset(2, 2),
                                    blurRadius: 4.r,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Enter Email ID',
                                        hintStyle: AppTextStyles.inputHint,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Container(
                                    height: 60.h,
                                    width: 180.w,
                                    decoration: BoxDecoration(
                                      gradient: AppGradients.buttonGradient,
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Send',
                                          style: AppTextStyles.buttonText,
                                        ),
                                        SizedBox(width: 10.w),
                                        Transform.rotate(
                                          angle: 0,
                                          child: Icon(Icons.send,
                                              color: AppColors.buttonText,
                                              size: 24.w),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Main content
                  Positioned(
                    left: 92.w,
                    top: 239.h,
                    child: SizedBox(
                      width: 1640.w,
                      height: 340.32.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Logo/About/Social
                          SizedBox(
                            width: 391.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Logo + About
                                SizedBox(
                                  height: 232.32.h,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/osp-logo-footer.png',
                                        width: 300.w,
                                        height: 58.32.h,
                                        fit: BoxFit.contain,
                                      ),
                                      SizedBox(height: 24.h),
                                      Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae hendrerit lectus. Praesent vitae consequat mi. Maecenas auctor sed sapien ut bibendum. Nam in viverra justo.',
                                        style: TextStyle(
                                          fontFamily: 'Nunito Sans',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20.sp,
                                          height: 1.5,
                                          color: Color(0xFFF2F2F2),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 48.h),
                                // Social Media
                                SizedBox(
                                  width: 300.w,
                                  height: 60.h,
                                  child: Row(
                                    children: [
                                      _FooterSocialIcon(
                                        asset: 'assets/icons/instagram.png',
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFF24439B),
                                            Color(0xFF15A5CD)
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                      SizedBox(width: 60.w),
                                      _FooterSocialIcon(
                                        asset: 'assets/icons/facebook.png',
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFF24439B),
                                            Color(0xFF15A5CD)
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                      SizedBox(width: 60.w),
                                      _FooterSocialIcon(
                                        asset: 'assets/icons/x.png',
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFF24439B),
                                            Color(0xFF15A5CD)
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 206.w),
                          // Menu
                          SizedBox(
                            width: 146.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Menu',
                                    style: TextStyle(
                                        fontFamily: 'Basement Grotesque',
                                        fontWeight: FontWeight.w800,
                                        fontSize: 32.sp,
                                        color: Color(0xFFF2F2F2))),
                                SizedBox(height: 24.h),
                                ...[
                                  'Home',
                                  'About Us',
                                  'Forums',
                                  'Contact Us',
                                  'RFP'
                                ].map((item) => Padding(
                                      padding: EdgeInsets.only(bottom: 24.h),
                                      child: Text(item,
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20.sp,
                                              color: Color(0xFFEBE6DC))),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(width: 206.w),
                          // Info
                          SizedBox(
                            width: 236.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Info',
                                    style: TextStyle(
                                        fontFamily: 'Basement Grotesque',
                                        fontWeight: FontWeight.w800,
                                        fontSize: 32.sp,
                                        color: Color(0xFFF2F2F2))),
                                SizedBox(height: 24.h),
                                Text('Terms & Conditions',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20.sp,
                                        color: Color(0xFFF2F2F2),
                                        height: 1.5)),
                                SizedBox(height: 24.h),
                                Text('Privacy Policy',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20.sp,
                                        color: Color(0xFFF2F2F2),
                                        height: 1.5)),
                                SizedBox(height: 24.h),
                                Text('Forum code of conduct',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20.sp,
                                        color: Color(0xFFF2F2F2),
                                        height: 1.5)),
                              ],
                            ),
                          ),
                          Spacer(),
                          // Contact
                          SizedBox(
                            width: 303.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Contact',
                                    style: TextStyle(
                                        fontFamily: 'Basement Grotesque',
                                        fontWeight: FontWeight.w800,
                                        fontSize: 32.sp,
                                        color: Color(0xFFF2F2F2))),
                                SizedBox(height: 24.h),
                                Row(
                                  children: [
                                    Icon(Icons.phone,
                                        color: Color(0xFFF2F2F2), size: 24.w),
                                    SizedBox(width: 16.w),
                                    Text('+1 323-234-5812',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20.sp,
                                            color: Color(0xFFF2F2F2),
                                            height: 1.5)),
                                  ],
                                ),
                                SizedBox(height: 16.h),
                                Row(
                                  children: [
                                    Icon(Icons.email,
                                        color: Color(0xFFF2F2F2), size: 24.w),
                                    SizedBox(width: 16.w),
                                    Text('example@gmail.com',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20.sp,
                                            color: Color(0xFFF2F2F2),
                                            height: 1.5)),
                                  ],
                                ),
                                SizedBox(height: 16.h),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.location_on,
                                        color: Color(0xFFF2F2F2), size: 24.w),
                                    SizedBox(width: 16.w),
                                    SizedBox(
                                      width: 263.w,
                                      child: Text(
                                          'Lorem ipsum dolor sit amet, consectetur',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20.sp,
                                              color: Color(0xFFF2F2F2),
                                              height: 1.5)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Divider and copyright
                  Positioned(
                    left: 92.w,
                    top: 625.h,
                    child: SizedBox(
                      width: 1640.w,
                      height: 48.h,
                      child: Column(
                        children: [
                          Container(
                            width: 1640.w,
                            height: 2.h,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0x00FFFFF0),
                                  Color(0xFFFFFFF0),
                                  Color(0x00FFFFF0),
                                ],
                                stops: [0.0, 0.515, 1.0],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                          ),
                          SizedBox(height: 14.h),
                          Text('2025 All Rights Reserved',
                              style: TextStyle(
                                  fontFamily: 'Nunito Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20.sp,
                                  color: Color(0xFFFDFDFD),
                                  height: 1.5)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterSocialIcon extends StatelessWidget {
  final String asset;
  final Gradient gradient;
  const _FooterSocialIcon(
      {required this.asset, required this.gradient, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 60.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: gradient,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF24439B).withOpacity(0.25),
            blurRadius: 4.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: asset.endsWith('.png')
            ? SizedBox(width: 32.w, height: 32.h, child: Image.asset(asset))
            : Icon(Icons.ac_unit, color: AppColors.buttonText, size: 24.w),
      ),
    );
  }
}
