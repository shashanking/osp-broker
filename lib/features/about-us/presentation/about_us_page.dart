import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osp_broker/core/widgets/footer_section.dart';
import 'package:osp_broker/features/home/presentation/what_we_offer_section.dart';
import '../../../core/widgets/navbar.dart';
import 'about_us_mission_section.dart';
import 'about_us_why_choose_section.dart';
import 'about_us_join_section.dart';
import 'package:osp_broker/features/about-us/presentation/_about_us_hero_video.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBE6DC),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: 32.h),
          const AppNavBar(
            height: 58,
            bgColor: Colors.transparent,
          ),
          SizedBox(height: 48.h),
          // Hero Section
          Center(
            child: Container(
              width: 0.92.sw,
              height: 894.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.r),
                child: Stack(
                  children: [
                    AboutUsHeroVideo(),
                    // Gradient overlay
                    Positioned(
                      left: -1,
                      top: 1,
                      child: Container(
                        width: 0.92.sw,
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
                        width: 0.8.sw,
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
                                color: Color(0xFFF2F2F2),
                              ),
                            ),

                            SizedBox(height: 32.h),
                            // Subheadline
                            SizedBox(
                              width: 0.8.sw,
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
                            Spacer(),
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
                            SizedBox(height: 30.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // About Us Mission Section (Section 2)
          const AboutUsMissionSection(),
          const WhatWeOfferSection(),
          const AboutUsWhyChooseSection(),
          const AboutUsJoinSection(),
          const FooterSection(),
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
        padding: EdgeInsets.symmetric(
            horizontal: 42.w), // Slightly reduced for dynamic sizing
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(109.r),
          gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFF24439B), // #000000 23%
              Color(0xFF4F6EB3),
              Color(0xFF6FCFEA),
            ],
            stops: [0.68, 0.78, 1.0],
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
