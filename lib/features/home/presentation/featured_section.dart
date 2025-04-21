import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1080.h,
      color: const Color(0xFFEBE6DC),
      child: Stack(
        children: [
          // Top gradient overlay
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
          // Section Title
          Positioned(
            top: 145.h,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Featured Auctions & Forum Highlights',
                style: TextStyle(
                  fontFamily: 'Basement Grotesque',
                  fontWeight: FontWeight.w800,
                  fontSize: 40.sp,
                  height: 1.35,
                  color: const Color(0xFF121212),
                ),
              ),
            ),
          ),
          // Feature Cards
          // Main Auction Card (left)
          Positioned(
            left: 140.w,
            top: 279.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32.r),
              child: _FeaturedAuctionCard(),
            ),
          ),
          // Forum Highlight Card 1 (top right)
          Positioned(
            left: 1120.w,
            top: 279.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32.r),
              child: _ForumHighlightCard(
                image: 'assets/images/featured-img2.png',
                title: 'Trending Discussions',
                description:
                    'Jump into popular topics in our community forums—from technical debates to industry-specific cheat sheets—where your expertise is valued and rewarded.',
              ),
            ),
          ),
          // Forum Highlight Card 2 (bottom right)
          Positioned(
            left: 1120.w,
            top: 623.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32.r),
              child: _ForumHighlightCard(
                image: 'assets/images/featured-img3.png',
                title: 'Trending Discussions',
                description:
                    'Jump into popular topics in our community forums—from technical debates to industry-specific cheat sheets—where your expertise is valued and rewarded.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeaturedAuctionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 948.w,
      height: 656.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16.r,
            offset: Offset(0, 8.h),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Card background image
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32.r),
              child: Image.asset(
                'assets/images/featured-img1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Bottom gradient overlay
          Positioned(
            left: 0,
            right: 0,
            top: 352.h,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x00000000),
                    Color(0xFF000000),
                  ],
                ),
              ),
            ),
          ),
          // Text and tags
          Positioned(
            left: 32.w,
            right: 32.w,
            bottom: 32.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Live Auctions',
                        style: TextStyle(
                          fontFamily: 'Basement Grotesque',
                          fontWeight: FontWeight.w800,
                          fontSize: 24.sp,
                          color: const Color(0xFFF2F2F2),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Discover our hottest auctions happening now! With live bidding and real-time updates, every moment counts.',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          fontSize: 20.sp,
                          color: const Color(0xFFEBE6DC),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        children: [
                          _Tag(
                            icon: Icons.favorite,
                            iconColor: const Color(0xFFE21548),
                            label: '22.4K Likes',
                          ),
                          SizedBox(width: 16.w),
                          _Tag(
                            icon: Icons.comment,
                            iconColor: const Color(0xFF333333),
                            label: '2276 Comments',
                          ),
                        ],
                      ),
                    ],
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

class _ForumHighlightCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const _ForumHighlightCard({
    required this.image,
    required this.title,
    required this.description,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 660.w,
      height: 312.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Stack(
        children: [
          // Card background image
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Bottom gradient overlay
          Positioned(
            left: 0,
            right: 0,
            top: 100.h,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x00000000),
                    Color(0xFF000000),
                  ],
                ),
              ),
            ),
          ),
          // Text
          Positioned(
            left: 24.w,
            right: 24.w,
            bottom: 32.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Basement Grotesque',
                    fontWeight: FontWeight.w800,
                    fontSize: 24.sp,
                    color: const Color(0xFFF2F2F2),
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  description,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                    color: const Color(0xFFEBE6DC),
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

class _Tag extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  const _Tag({
    required this.icon,
    required this.iconColor,
    required this.label,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xFFEBE6DC),
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 16.w),
          SizedBox(width: 8.w),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: const Color(0xFF333333),
            ),
          ),
        ],
      ),
    );
  }
}
