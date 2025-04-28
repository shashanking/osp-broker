import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';

class AboutUsWhyChooseSection extends StatefulWidget {
  const AboutUsWhyChooseSection({super.key});

  @override
  State<AboutUsWhyChooseSection> createState() =>
      _AboutUsWhyChooseSectionState();
}

class _AboutUsWhyChooseSectionState extends State<AboutUsWhyChooseSection> {
  int _highlightedIndex = 0;
  late Timer _timer;

  final List<_WhyUsFeature> features = [
    _WhyUsFeature(
      icon: 'assets/icons/customer-centricity.png',
      title: 'User-Centric Design',
      description:
          'Our platform is built with intuitive navigation and a seamless user experience.',
      borderColor: Color(0xFFD59823),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF24439B), Color(0xFF15A5CD)],
      ),
    ),
    _WhyUsFeature(
      icon: 'assets/icons/protect.png',
      title: 'Security & Trust',
      description:
          'We prioritize secure transactions, verified users, and fair bidding practices.',
      borderColor: Color(0xFF24439B),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF24439B), Color(0xFF15A5CD)],
      ),
    ),
    _WhyUsFeature(
      icon: 'assets/icons/cloud.png',
      title: 'Scalability & Growth',
      description:
          'Whether you\'re an individual or an enterprise, we provide the tools to help you thrive.',
      borderColor: Color(0xFF24439B),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF24439B), Color(0xFF15A5CD)],
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _highlightedIndex = (_highlightedIndex + 1) % features.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1.sh,
      decoration: BoxDecoration(
        color: const Color(0xFFEBE6DC),
        image: DecorationImage(
          image: const AssetImage('assets/images/about-page-sec4-bg.png'),
          fit: BoxFit.cover,
          opacity: 0.3,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 64.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Left: Animated Wheel
            Center(
              child: SizedBox(
                width: 684.w,
                height: 0.7.sh,
                child: Stack(
                  children: [
                    // Outer circle (blue border)
                    Positioned(
                      left: 0,
                      top: 82.h,
                      child: Container(
                        width: 607.w,
                        height: 607.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Color(0xFF24439B), width: 12.w),
                        ),
                      ),
                    ),
                    // Inner circle (light blue)
                    Positioned(
                      left: 26.w,
                      top: 108.h,
                      child: Container(
                        width: 555.w,
                        height: 555.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF25B4DC).withOpacity(0.1),
                        ),
                      ),
                    ),
                    // Bottom left feature
                    Positioned(
                      left: 0.w,
                      top: 480.h,
                      child: _FeatureCircle(
                        feature: features[2],
                        isHighlighted: _highlightedIndex == 2,
                        size: 198.w,
                        iconSize: 120.w,
                      ),
                    ),
                    // Top feature
                    Positioned(
                      left: 210.w,
                      top: 20.h,
                      child: _FeatureCircle(
                        feature: features[0],
                        isHighlighted: _highlightedIndex == 0,
                        size: 198.w,
                        iconSize: 120.w,
                      ),
                    ),
                    // Bottom right feature
                    Positioned(
                      left: 428.w,
                      top: 480.h,
                      child: _FeatureCircle(
                        feature: features[1],
                        isHighlighted: _highlightedIndex == 1,
                        size: 198.w,
                        iconSize: 120.w,
                      ),
                    ),
                    // Center animated text only
                    Positioned(
                      left: 122.w,
                      top: 310.h,
                      child: SizedBox(
                        width: 400.w,
                        child: Column(
                          children: [
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return const LinearGradient(
                                  colors: [
                                    Color(0xFF24439B),
                                    Color(0xFF15A5CD)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ).createShader(bounds);
                              },
                              child: Text(
                                features[_highlightedIndex].title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Basement Grotesque',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 24.sp,
                                  height: 1.25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              features[_highlightedIndex].description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                fontSize: 20.sp,
                                height: 1.5,
                                color: const Color(0xFF333333),
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
            SizedBox(width: 120.w),
            // Right: Text and Button
            SizedBox(
              width: 672.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Why ',
                          style: TextStyle(
                            fontFamily: 'Basement Grotesque',
                            fontWeight: FontWeight.w800,
                            fontSize: 40.sp,
                            height: 54 / 40,
                            color: Color(0xFF121212),
                          ),
                        ),
                        TextSpan(
                          text: 'Choose ',
                          style: TextStyle(
                            fontFamily: 'Basement Grotesque',
                            fontWeight: FontWeight.w800,
                            fontSize: 40.sp,
                            height: 54 / 40,
                            color: Color(0xFFD59823),
                          ),
                        ),
                        TextSpan(
                          text: 'Us?',
                          style: TextStyle(
                            fontFamily: 'Basement Grotesque',
                            fontWeight: FontWeight.w800,
                            fontSize: 40.sp,
                            height: 54 / 40,
                            color: Color(0xFF121212),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'We offer a secure, user-friendly platform designed for seamless auctions, forums, and networking. With tiered memberships, exclusive benefits, and a trusted environment, we empower users to connect, trade, and grow with confidence.',
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
          ],
        ),
      ),
    );
  }
}

class _FeatureCircle extends StatelessWidget {
  final _WhyUsFeature feature;
  final bool isHighlighted;
  final double size;
  final double iconSize;
  const _FeatureCircle(
      {required this.feature,
      required this.isHighlighted,
      required this.size,
      required this.iconSize});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: size,
      height: size,
      // padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: isHighlighted
            ? feature.gradient
            : LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFEBE6DC), Color(0xFFEBE6DC)],
              ),
        border: Border.all(
          color: feature.borderColor,
          width: 12.w,
        ),
        borderRadius: BorderRadius.circular(99.r),
        boxShadow: isHighlighted
            ? [
                BoxShadow(
                  color: feature.borderColor.withOpacity(0.22),
                  blurRadius: 30,
                  spreadRadius: 2,
                ),
              ]
            : [],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            feature.icon,
            width: iconSize,
            height: iconSize,
            color: isHighlighted ? Colors.white : Color(0xFFD49823),
          ),
        ],
      ),
    );
  }
}

class _WhyUsFeature {
  final String icon;
  final String title;
  final String description;
  final Color borderColor;
  final Gradient gradient;
  const _WhyUsFeature({
    required this.icon,
    required this.title,
    required this.description,
    required this.borderColor,
    required this.gradient,
  });
}
