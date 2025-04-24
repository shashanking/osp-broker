import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../home/presentation/widgets/navbar.dart';
import 'membership_card_section.dart';
import '../../home/presentation/footer_section.dart';

class MembershipHeroSection extends StatelessWidget {
  const MembershipHeroSection({super.key});

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
              HeroSection(),
              SizedBox(width: 32.w, height: 32.h),
              MembershipCardSection(),
              SizedBox(width: 32.w, height: 32.h),
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 54.w, vertical: 54.h),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32.r),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.r),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 36, 68, 155),
                    Color.fromARGB(255, 21, 165, 205),
                  ],
                ),
                image: const DecorationImage(
                  image: AssetImage(
                      'assets/images/membership_herobanner.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 48.w, top: 64.h, bottom: 64.h),
                child: SizedBox(
                  height: 600.w,
                  child: Row(
                    children: [
                      // Left side: Texts
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Choose the ',
                                    style: TextStyle(
                                      fontFamily: 'Basement Grotesque',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 48.sp,
                                      color: Colors.white,
                                    ),
                              children: [
                                TextSpan(
                                  text: 'Choose the ',
                                  style: TextStyle(
                                    fontFamily: 'Basement Grotesque',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 48.sp,
                                    color: Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Perfect ',
                                  style: TextStyle(
                                    fontFamily: 'Basement Grotesque',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 48.sp,
                                    color: const Color(0xFFF5B12D),
                                  ),
                                ),
                                TextSpan(
                                  text: 'Membership for You',
                                  style: TextStyle(
                                    fontFamily: 'Basement Grotesque',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 48.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ]),),
                          SizedBox(height: 24.h),
                          Text(
                            'Unlock exclusive features and benefits tailored to your needs. Whether you\'re here to engage in forums, bid on auctions, or access premium services, our membership plans offer the right level of access for you. Upgrade anytime and maximize your experience!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 32.h),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF5B12D),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(32.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 32.w, vertical: 12.h),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Shop Now!',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 32.h),
                        ]),
                      ), Center(
                      child: SizedBox(
                        width: 600.w,
                        height: 600.w,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Circular background
                            Image.asset(
                              'assets/images/membership_hero_circular.png',
                              width: 600.w,
                              height: 600.w,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ),
                    ]),
                    // Right side: Circular image and membership cards
                   
                
              ),
            ),
          ),
        ),
      ),
    );
  }}


 