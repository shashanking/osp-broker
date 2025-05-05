import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/navbar.dart';
import 'rfp_track_section.dart';
import 'rfp_form_section.dart';
import '../../../core/widgets/footer_section.dart';

class RfpPage extends StatelessWidget {
  const RfpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBE6DC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Navbar at the top
              const AppNavBar(),
              _RfpHeroSection(),
              const RfpTrackSection(),
              RfpFormSection(),
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RfpHeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 84.w, vertical: 54.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32.r),
          child: Container(
            height: 850.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.r),
              
              image: const DecorationImage(
                image: AssetImage('assets/images/RFP_Hero_img.png'),
                
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.r),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                colors: [Color(0xFF24439B), Color.fromARGB(96, 21, 165, 205)],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 78.w, top: 64.h, bottom: 64.h),
                child: SizedBox(
                  height: 480.w,
                  child: Row(
                    children: [
                      // Left side: Texts
                      Expanded(
  flex: 6,
  child: SizedBox(
    width: 750,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  
                                  TextSpan(
                                    text: 'Submit Your Request for ',
                                    style: TextStyle(
                                      fontFamily: 'Basement Grotesque',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 44.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Pricing (RFP)',
                                    style: TextStyle(
                                      fontFamily: 'Basement Grotesque',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 44.sp,
                                      color: const Color(0xFFF5B12D),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              "Looking for the right solution for your project? Submit a Request for Pricing (RFP) and connect with experienced professionals ready to meet your needs. Whether you're seeking services, partnerships, or custom solutions, our platform ensures your request reaches the right audience.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 32.h),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.r),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 32.w, vertical: 12.h),
                                fixedSize: Size(390.w, 60.h),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Create Pricing',
                                style: TextStyle(
                                  color: Color(0xFF24439B),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ),
                      // Right side: Circular image
                      Expanded(
                        flex: 4,
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 800.w,
                            height: 800.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/RFP_Hero_circular_img.png',
                              fit: BoxFit.contain,
                              height: 800.h,
                              width: 800.w,
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
    );
  }
}
