import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osp_broker/core/theme/app_colors.dart';
import 'package:osp_broker/core/theme/app_text_styles.dart';
import 'package:osp_broker/core/theme/app_gradients.dart';

class ExploreSection extends StatelessWidget {
  const ExploreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 1080.h,
      child: Stack(
        children: [
          // BG overlay image
          Positioned.fill(
            child: Image.asset(
              'assets/images/explore-bg.png',
              fit: BoxFit.cover,
              color: AppColors.light.withOpacity(0.3),
              colorBlendMode: BlendMode.srcOver,
            ),
          ),
          // Gradient overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: AppGradients.verticalFooterBg,
              ),
            ),
          ),
          // Blog cards
          Positioned(
            left: 140.w,
            top: 132.h,
            child: SizedBox(
              width: 810.w,
              height: 880.h,
              child: Wrap(
                spacing: 20.w,
                runSpacing: 20.h,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    child: _ExploreBlogCard(
                      image: 'assets/images/explore-img1.png',
                      date: '25 Oct, 2024',
                      author: 'By Daniel',
                      title: 'How to Maximize Your Engagement in Online Forums',
                      desc:
                          'Want to get the most out of your forum experience? Learn how to engage with the community, contribute valuable insights, and build your reputation in discussions that matter.',
                      isLarge: true,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    child: _ExploreBlogCard(
                      image: 'assets/images/explore-img2.png',
                      date: '25 Oct, 2024',
                      author: 'By Daniel',
                      title:
                          'The Power of Online Communities in the Digital Age',
                      desc:
                          'From networking to knowledge-sharing, online forums have transformed how we connect. Discover the benefits of being part of an active digital community and how it can help you grow personally and professionally.',
                      isLarge: false,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    child: _ExploreBlogCard(
                      image: 'assets/images/explore-img3.png',
                      date: '25 Oct, 2024',
                      author: 'By Daniel',
                      title:
                          'Forum Etiquette: The Do’s and Don’ts of Online Discussions',
                      desc:
                          'A thriving forum relies on respectful and meaningful conversations. Here’s a guide to proper forum etiquette, ensuring your interactions are positive, professional, and productive.',
                      isLarge: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Right: Text and CTA
          Positioned(
            left: 1100.w,
            top: (1080.h - 288.h) / 2,
            child: SizedBox(
              width: 672.w,
              // height: 288.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Explore Auctions & Forums',
                    style: AppTextStyles.heading40.copyWith(
                        fontSize: 40.sp, color: const Color(0xFF121212)),
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    'Whether you’re here to bid on premium listings or to share your expertise in our community forums, our intuitive interface ensures you can navigate every feature with ease.',
                    style: AppTextStyles.infoItem.copyWith(
                      fontSize: 20.sp,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 60.h),
                  SizedBox(
                    width: 195.w,
                    height: 52.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: Text(
                        'Learn More',
                        style: AppTextStyles.buttonText,
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

class _ExploreBlogCard extends StatefulWidget {
  final String image, date, author, title, desc;
  final bool isLarge;
  const _ExploreBlogCard({
    required this.image,
    required this.date,
    required this.author,
    required this.title,
    required this.desc,
    required this.isLarge,
    super.key,
  });

  @override
  State<_ExploreBlogCard> createState() => _ExploreBlogCardState();
}

class _ExploreBlogCardState extends State<_ExploreBlogCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: SizedBox(
        width: widget.isLarge ? 809.w : 395.w,
        height: widget.isLarge ? 380.h : 480.h,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24.r),
              child: Image.asset(
                widget.image,
                width: widget.isLarge ? 809.w : 395.w,
                height: widget.isLarge ? 378.h : 480.h,
                fit: BoxFit.cover,
              ),
            ),
            // Black gradient overlay
            Positioned(
              left: 0,
              right: 0,
              top: widget.isLarge ? 0.3368 * 380.h : 0.1167 * 480.h,
              bottom: widget.isLarge ? 0.0053 * 380.h : 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x00000000),
                      AppColors.black,
                    ],
                    stops: [0.0, 1.0],
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: 24.w,
              right: 24.w,
              bottom: _hovered ? 24.h : -80.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.date,
                    style: AppTextStyles.infoItem.copyWith(
                      color: AppColors.menuText,
                      fontSize: 16.sp,
                      height: 24 / 16,
                    ),
                  ),
                  Text(
                    widget.author,
                    style: AppTextStyles.infoItem.copyWith(
                      color: AppColors.menuText,
                      fontSize: 16.sp,
                      height: 24 / 16,
                    ),
                  ),
                  Text(
                    widget.title,
                    style: AppTextStyles.heading40.copyWith(
                      color: AppColors.menuText,
                      fontSize: 24.sp,
                      height: 36 / 24,
                    ),
                  ),
                  Text(
                    widget.desc,
                    style: AppTextStyles.infoItem.copyWith(
                      color: AppColors.menuText,
                      fontSize: 20.sp,
                      height: 30 / 20,
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
