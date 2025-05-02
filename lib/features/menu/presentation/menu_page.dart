import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:osp_broker/core/constants/app_constants.dart';
import 'package:osp_broker/core/theme/app_colors.dart';
import '../../menu/application/menu_notifier.dart';
import '../../menu/presentation/_contact_row.dart';

class MenuPage extends ConsumerWidget {
  final VoidCallback? onClose;
  const MenuPage({Key? key, this.onClose}) : super(key: key);

  static const Color bgColor = Color(0xFFEBE6DC);
  static const Color highlightColor = Color(0xFF24439B);
  static const Color menuTextColor = Color(0xFF121212);
  static const Color borderColor = Color(0xFFC8C8C8);
  static const Color rightPanelColor = Color(0xFF333333);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuState = ref.watch(menuNotifierProvider);
    final menuNotifier = ref.read(menuNotifierProvider.notifier);

    final menuItems1 = [
      {'label': 'HOME', 'route': '/'},
      {'label': 'ABOUT US', 'route': '/about'},
      {'label': 'AUCTIONS', 'route': '/auctions'},
      {'label': 'RFP', 'route': '/rfp'},
      {'label': 'PRODUCT SHOP', 'route': '/product-shop'},
      {'label': 'PLATFORM SHOP', 'route': '/platform-shop'},
      {'label': 'SERVICE SHOP', 'route': '/service-shop'},
      {'label': 'ANNOUNCEMENTS', 'route': '/announcements'},
    ];
    final menuItems2 = [
      {'label': 'FORUMS', 'route': '/forums'},
      {'label': 'GIFT SHOP', 'route': '/gift-shop'},
      {'label': 'BLOG', 'route': '/blog'},
      {'label': 'OSP DIRECTORY', 'route': '/directory'},
      {'label': 'MEMBER LISTS', 'route': '/membership'},
      {'label': 'BUSINESS MEMBER PAGES', 'route': '/business-members'},
      {'label': 'GAMES', 'route': '/games'},
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
                  padding: EdgeInsets.only(left: 140.w, top: 138.h, bottom: 138.h, right: 60.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // First column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: menuItems1.map((item) {
                            return GestureDetector(
                              onTap: () {
                                menuNotifier.selectMenu(item['label']!);
                                context.go(item['route']!);
                              },
                              child: _MenuItem(
                                label: item['label']!,
                                isActive: menuState.selectedMenu == item['label'],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(width: 40.w),
                      // Second column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: menuItems2.map((item) {
                            return GestureDetector(
                              onTap: () {
                                menuNotifier.selectMenu(item['label']!);
                                context.go(item['route']!);
                              },
                              child: _MenuItem(
                                label: item['label']!,
                                isActive: menuState.selectedMenu == item['label'],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Right panel
              Expanded(
                flex: 1,
                child: Container(
                  color: rightPanelColor,
                  child: Stack(
                    children: [
                      // Close button
                      Positioned(
                        top: 32.h,
                        right: 48.w,
                        child: GestureDetector(
                          onTap: onClose ?? () => context.pop(),
                          child: Container(
                            width: 141.w,
                            height: 52.h,
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(49.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.close, color: rightPanelColor, size: 24.w),
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
                                color: AppColors.menuText,
                              ),
                            ),
                            SizedBox(height: 24.h),
                            ContactRow(
                              icon: Icons.phone,
                              text: GetintouchConstants.phone,
                            ),
                            SizedBox(height: 20.h),
                            ContactRow(
                              icon: Icons.email,
                              text: GetintouchConstants.email,
                            ),
                            SizedBox(height: 20.h),
                            ContactRow(
                              icon: Icons.location_on,
                              text: GetintouchConstants.address,
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
                                  side: BorderSide(color: AppColors.menuText, width: 2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 40.w),
                                ),
                                onPressed: () {
                                  context.go('/signup');
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.sp,
                                    color: AppColors.menuText,
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
                                  backgroundColor: AppColors.menuText,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 40.w),
                                ),
                                onPressed: () {
                                  context.go('/login');
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.sp,
                                    color: AppColors.dark,
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
        border: isActive
            ? null
            : Border.all(color: MenuPage.borderColor, width: 1),
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
