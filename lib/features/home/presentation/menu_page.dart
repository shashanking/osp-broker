import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MenuPage extends StatelessWidget {
  final VoidCallback? onClose;
  const MenuPage({Key? key, this.onClose}) : super(key: key);

  static const Color bgColor = Color(0xFFEBE6DC);
  static const Color highlightColor = Color(0xFF24439B);
  static const Color menuTextColor = Color(0xFF121212);
  static const Color borderColor = Color(0xFFC8C8C8);
  static const Color rightPanelColor = Color(0xFF333333);

  @override
  Widget build(BuildContext context) {
    final menuItems1 = [
      'HOME',
      'ABOUT US',
      'AUCTIONS',
      'RFP',
      'PRODUCT SHOP',
      'PLATFORM SHOP',
      'SERVICE SHOP',
      'ANNOUNCEMENTS'
    ];
    final menuItems2 = [
      'FORUMS',
      'GIFT SHOP',
      'BLOG',
      'OSP DIRECTORY',
      'MEMBER LISTS',
      'BUSINESS MEMBER PAGES',
      'GAMES'
    ];
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          // Gradient Overlay
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
                  stops: [0, 0.09, 0.25, 0.75, 1],
                ),
              ),
            ),
          ),
          // Main Content
          Row(
            children: [
              // Left: Menu
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 140.w, top: 138.h, bottom: 138.h, right: 60.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // First column (8 items)
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                              menuItems1.length,
                              (i) => _MenuItem(
                                    label: menuItems1[i],
                                    isActive: i == 0, // HOME
                                  )),
                        ),
                      ),
                      SizedBox(width: 40.w),
                      // Second column (7 items)
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(menuItems2.length, (i) {
                            if (menuItems2[i] == 'MEMBER LISTS') {
                              return GestureDetector(
                                onTap: () {
                                  context.go('/membership');
                                },
                                child: _MenuItem(
                                  label: menuItems2[i],
                                  isActive: false,
                                ),
                              );
                            } else {
                              return _MenuItem(
                                label: menuItems2[i],
                                isActive:
                                    menuItems2[i] == 'BUSINESS MEMBER PAGES',
                              );
                            }
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Right: Contact & Actions
              Container(
                width: 582.w,
                height: double.infinity,
                color: rightPanelColor,
                child: Stack(
                  children: [
                    // Close button
                    Positioned(
                      top: 32.h,
                      right: 48.w,
                      child: GestureDetector(
                        onTap: onClose ?? () => Navigator.of(context).pop(),
                        child: Container(
                          width: 141.w,
                          height: 52.h,
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(49.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.close,
                                  color: rightPanelColor, size: 24.w),
                              SizedBox(width: 10.w),
                              Text(
                                'Menu',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                  color: rightPanelColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Contact Info
                    Positioned(
                      left: 48.w,
                      top: 220.h,
                      right: 48.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Get in touch',
                            style: TextStyle(
                              fontFamily: 'Basement Grotesque',
                              fontWeight: FontWeight.w800,
                              fontSize: 40.sp,
                              color: bgColor,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          _ContactRow(
                            icon: Icons.phone,
                            text: '+1(931)-266-6101',
                          ),
                          SizedBox(height: 20.h),
                          _ContactRow(
                            icon: Icons.email,
                            text: 'example@gmail.com',
                          ),
                          SizedBox(height: 20.h),
                          _ContactRow(
                            icon: Icons.location_on,
                            text:
                                'Lorem ipsum dolor sit amet,orem ipsum dolor sit amet,',
                            multiLine: true,
                          ),
                        ],
                      ),
                    ),
                    // Buttons
                    Positioned(
                      left: 48.w,
                      right: 48.w,
                      bottom: 80.h,
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 52.h,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side:
                                    const BorderSide(color: bgColor, width: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 40.w),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                  color: bgColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          SizedBox(
                            width: double.infinity,
                            height: 52.h,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: bgColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 40.w),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                  color: rightPanelColor,
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
            ],
          ),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String label;
  final bool isActive;
  const _MenuItem({required this.label, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      height: 72.h,
      decoration: BoxDecoration(
        color: isActive ? MenuPage.highlightColor : MenuPage.bgColor,
        border:
            isActive ? null : Border.all(color: MenuPage.borderColor, width: 1),
        borderRadius: BorderRadius.circular(61.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 0),
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w800,
          fontSize: 24.sp,
          color: isActive ? MenuPage.bgColor : MenuPage.menuTextColor,
        ),
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool multiLine;
  const _ContactRow(
      {required this.icon, required this.text, this.multiLine = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
          multiLine ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Icon(icon, color: MenuPage.bgColor, size: 20.w),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              fontSize: 20.sp,
              color: multiLine ? Color(0xFFF2F2F2) : MenuPage.bgColor,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
