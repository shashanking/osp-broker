import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/navbar.dart';

class AboutUsHeroSection extends StatelessWidget {
  const AboutUsHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBE6DC),
      body: Stack(
        children: [
          // Main content
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Column(
              children: [
                SizedBox(height: 32.h),
                const AppNavBar(
                  height: 58,
                  bgColor: Colors.transparent,
                ),
                SizedBox(height: 48.h),
                // Centered Frame
                Center(
                  child: Container(
                    width: 1824.w,
                    height: 894.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/about-us-banner.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                    child: Stack(
                      children: [
                        // Gradient overlay
                        Positioned(
                          left: -1,
                          top: 1,
                          child: Container(
                            width: 1826.w,
                            height: 892.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32.r),
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0x00000000),
                                  Color(0xFF000000),
                                ],
                                stops: [0.0, 1.0],
                              ),
                            ),
                            // Opacity handled by gradient colors
                          ),
                        ),
                        // Content
                        Positioned(
                          left: 48.w,
                          top: 138.h,
                          child: SizedBox(
                            width: 1728.w,
                            height: 718.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Headline
                                Text(
                                  'Empowering Connections, Enabling Opportunities',
                                  style: TextStyle(
                                    fontFamily: 'Basement Grotesque',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 64.sp,
                                    height: 1.2,
                                    color: const Color(0xFFF2F2F2),
                                  ),
                                ),
                                SizedBox(height: 32.h),
                                // Subheadline
                                SizedBox(
                                  width: 1201.w,
                                  child: Text(
                                    'At Osp Brokers, we believe in creating a dynamic online marketplace where businesses and individuals can connect, collaborate, and compete. Our platform is designed to offer a seamless experience for members, allowing them to participate in auctions, engage in community discussions, and unlock exclusive business opportunities.',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20.sp,
                                      height: 1.5,
                                      color: const Color(0xFFEBE6DC),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 60.h),
                                // Buttons grid
                                Wrap(
                                  spacing: 32.w,
                                  runSpacing: 24.h,
                                  children: const [
                                    _HeroButton(label: 'Auctions'),
                                    _HeroButton(label: 'RFP'),
                                    _HeroButton(label: 'Business Mall'),
                                    _HeroButton(label: 'Memberships'),
                                    _HeroButton(label: 'Join Now'),
                                    _HeroButton(label: 'Business Directories'),
                                    _HeroButton(label: 'User Mall'),
                                    _HeroButton(label: 'Cheat Sheets'),
                                    _HeroButton(label: 'Shopping Mall'),
                                    _HeroButton(label: 'Polls'),
                                    _HeroButton(label: 'Business Directories'),
                                    _HeroButton(label: 'Partners'),
                                    _HeroButton(label: 'Media'),
                                    _HeroButton(label: 'Services Shop'),
                                    _HeroButton(label: 'Media'),
                                    _HeroButton(label: 'Products Shop'),
                                    _HeroButton(label: 'Training'),
                                    _HeroButton(label: 'Jobs'),
                                    _HeroButton(label: 'Newsletter'),
                                  ],
                                ),
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
          ),
        ],
      ),
    );
  }
}

class _HeroButton extends StatelessWidget {
  final String label;
  const _HeroButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        constraints: BoxConstraints(minWidth: 0),
        height: 52.h,
        padding: EdgeInsets.symmetric(horizontal: 32.w), // Slightly reduced for dynamic sizing
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(109.r),
          gradient: const RadialGradient(
            center: Alignment(0.0, 0.0),
            radius: 1.0,
            colors: [
              Color(0x3B000000), // #000000 23%
              Colors.transparent,
            ],
            stops: [0.23, 1.0],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: const Offset(4, 38),
              blurRadius: 62,
              spreadRadius: 0,
            ),
            // Figma inner shadow
            BoxShadow(
              color: Colors.white.withOpacity(0.15),
              offset: const Offset(-3, -4),
              blurRadius: 7,
              spreadRadius: 0,
              blurStyle: BlurStyle.inner,
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w800,
              fontSize: 20.sp,
              height: 1.5,
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(1, 1),
                  blurRadius: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

