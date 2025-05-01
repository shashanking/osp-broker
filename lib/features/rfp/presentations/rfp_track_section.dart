import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RfpTrackSection extends StatelessWidget {
  const RfpTrackSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 48.h),
      child: Center(
        child: SizedBox(
          // width: 1600.w, // adjust as needed for your layout
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background track image
              Positioned.fill(
                child: Image.asset(
                  'assets/images/explore-bg.png',
                  fit: BoxFit.cover,
                  width: 1800.w,
                ),
              ),
              // Steps track image above
              Image.asset(
                'assets/images/RFP_Track_Img.png',
                fit: BoxFit.contain,
                width: 1800.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
