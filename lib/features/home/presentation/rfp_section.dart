import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';


class RFPSection extends StatelessWidget {
  const RFPSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 872.h,
      color: const Color(0xFFEBE6DC),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background gradient overlay
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
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
            ),
          ),
          // Blue gradient banner
          Center(
            child: Container(
              width: 1640.w,
              height: 546.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/rfp-banner-background.png'),
                    fit: BoxFit.cover),
                gradient: const LinearGradient(
                  colors: [Color(0xFF24439B), Color(0xFF15A5CD)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(32.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 32.r,
                    offset: Offset(0, 8.h),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Decorative overlay (optional, for extra effect)

                  // Left: Text content
                  Positioned(
                    left: 64.w,
                    top: 0,
                    bottom: 0,
                    child: SizedBox(
                      width: 671.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Submit Your Request for\n',
                                  style: TextStyle(
                                    fontFamily: 'Basement Grotesque',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 40.sp,
                                    height: 1.35,
                                    color: const Color(0xFFF2F2F2),
                                  ),
                                ),
                                TextSpan(
                                  text: 'Pricing (RFP)',
                                  style: TextStyle(
                                    fontFamily: 'Basement Grotesque',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 40.sp,
                                    height: 1.35,
                                    color: const Color(0xFFD59823),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 32.h),
                          Text(
                            'Looking for the right solution for your project? Submit a Request for Proposal (RFP) and connect with experienced professionals ready to meet your needs. Whether you’re seeking services, partnerships, or custom solutions, our platform ensures your request reaches the right audience.',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              fontSize: 20.sp,
                              height: 1.5,
                              color: const Color(0xFFEBE6DC),
                            ),
                          ),
                          SizedBox(height: 48.h),
                          // CTA Button
                          SizedBox(
                            width: 390.w,
                            height: 60.h,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFEBE6DC),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                elevation: 0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 48.w, vertical: 10.h),
                              ),
                              onPressed: () {
                                context.go('/rfp');
                              },
                              child: ShaderMask(
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
                                  'Request For Pricing',
                                  style: TextStyle(
                                    fontFamily: 'Basement Grotesque',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20.sp,
                                    color: const Color(0xFF24439B),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Right: Banner image
                  Positioned(
                    right: 64.w,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: SizedBox(
                        width: 645.w,
                        height: 560.h,
                        child: Image.asset(
                          'assets/images/rfp-banner-image.png',
                          fit: BoxFit.contain,
                        ),
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
