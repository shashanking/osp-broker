import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:osp_broker/features/authentication/presentations/signup_page.dart';

class Auction {
  final String imageUrl;
  final String userName;
  final String userAvatarUrl;
  final String title;
  final String subtitle;
  final String estimate;
  final String location;
  final String bid;
  final String timeLeft;
  final int bids;
  final int comments;
  final bool isFavorite;
  const Auction({
    required this.imageUrl,
    required this.userName,
    required this.userAvatarUrl,
    required this.title,
    required this.subtitle,
    required this.estimate,
    required this.location,
    required this.bid,
    required this.timeLeft,
    required this.bids,
    required this.comments,
    this.isFavorite = false,
  });
}

const List<Auction> sampleAuctions = [
  Auction(
    imageUrl: 'assets/images/auction-sample.png',
    userName: 'Reymond',
    userAvatarUrl: 'assets/images/auction-sample.png',
    title: 'BMW M3',
    subtitle: 'Lorem ipsum dolor',
    estimate: 'Estimate \$25,000',
    location: 'New York',
    bid: '24,250',
    timeLeft: '32:45:53', 
    bids: 43,
    comments: 32,
    isFavorite: false,
  ),
  Auction(
    imageUrl: 'assets/images/auction-sample.png',
    userName: 'Reymond',
    userAvatarUrl: 'assets/images/auction-sample.png',
    title: 'Aston Martin DB 9',
    subtitle: 'Lorem ipsum dolor',
    estimate: 'Estimate \$80,000',
    location: 'California',
    bid: '77,200',
    timeLeft: '22:45:53',
    bids: 53,
    comments: 12,
    isFavorite: true,
  ),
  Auction(
    imageUrl: 'assets/images/auction-sample.png',
    userName: 'Reymond',
    userAvatarUrl: 'assets/images/auction-sample.png',
    title: 'Laser Metal Cutter',
    subtitle: 'Lorem ipsum dolor',
    estimate: 'Estimate \$125,000',
    location: 'New York',
    bid: '124,250',
    timeLeft: '07:45:53',
    bids: 43,
    comments: 32,
    isFavorite: false,
  ),
  Auction(
    imageUrl: 'assets/images/auction-sample.png',
    userName: 'Reymond',
    userAvatarUrl: 'assets/images/auction-sample.png',
    title: 'Gears',
    subtitle: 'Lorem ipsum dolor',
    estimate: 'Estimate \$5,000',
    location: 'New York',
    bid: '4,650',
    timeLeft: '32:45:53',
    bids: 43,
    comments: 32,
    isFavorite: false,
  ),
  Auction(
    imageUrl: 'assets/images/auction-sample.png',
    userName: 'Reymond',
    userAvatarUrl: 'assets/images/auction-sample.png',
    title: 'Gears',
    subtitle: 'Lorem ipsum dolor',
    estimate: 'Estimate \$5,000',
    location: 'New York',
    bid: '4,650',
    timeLeft: '32:45:53',
    bids: 43,
    comments: 32,
    isFavorite: true,
  ),
  Auction(
    imageUrl: 'assets/images/auction-sample.png',
    userName: 'Sherly',
    userAvatarUrl: 'assets/images/auction-sample.png',
    title: 'BMW M3',
    subtitle: 'Lorem ipsum dolor',
    estimate: 'Estimate \$25,000',
    location: 'New York',
    bid: '24,250',
    timeLeft: '32:45:53',
    bids: 43,
    comments: 32,
    isFavorite: false,
  ),
  Auction(
    imageUrl: 'assets/images/auction-sample.png',
    userName: 'Sherly',
    userAvatarUrl: 'assets/images/auction-sample.png',
    title: 'BMW M3',
    subtitle: 'Lorem ipsum dolor',
    estimate: 'Estimate \$25,000',
    location: 'New York',
    bid: '24,250',
    timeLeft: '32:45:53',
    bids: 43,
    comments: 32,
    isFavorite: false,
  ),
  Auction(
    imageUrl: 'assets/images/auction-sample.png',
    userName: 'Reymond',
    userAvatarUrl: 'assets/images/auction-sample.png',
    title: 'Aston Martin DB 9',
    subtitle: 'Lorem ipsum dolor',
    estimate: 'Estimate \$80,000',
    location: 'California',
    bid: '77,200',
    timeLeft: '22:45:53',
    bids: 53,
    comments: 12,
    isFavorite: true,
  ),
];

class AuctionsSection extends StatelessWidget {
  const AuctionsSection({super.key});

  static const Color bgColor = Color(0xFFEBE6DC);

  

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1920, 1080),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Container(
            width: double.infinity,
            color: bgColor,
            child: Stack(
              children: [
                // Gradient overlay
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    height: 1037,
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
                // Main content
                Center(
                  child: Container(
                    width: 1640.w,
                    padding: EdgeInsets.symmetric(vertical: 62.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Header row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Auctions',
                              style: TextStyle(
                                fontFamily: 'Basement Grotesque',
                                fontWeight: FontWeight.w800,
                                fontSize: 40.sp,
                                height: 1.35,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 60.h),
                        AuctionSearchFilterBar(),
                        SizedBox(height: 60.h),
                        AuctionCardGrid(auctions: sampleAuctions),
                        SizedBox(height: 24.h),
                        SizedBox(
                          width: 180.w,
                          height: 48.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF24439B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              elevation: 0,
                            ),
                            onPressed: () {
                              context.go('/signup');
                            },
                            child: Text(
                              'View All',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                fontSize: 20.sp,
                                color: const Color(0xFFF2F2F2),
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
        });
  }
}

class AuctionSearchFilterBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Search bar
        Container(
          key: const Key('auctions_search_filter_bar'),
          width: 580.w,
          height: 60.h,
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          decoration: BoxDecoration(
            color: const Color(0xFFEBE6DC),
            borderRadius: BorderRadius.circular(48.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4.r,
                offset: Offset(0, -1.h),
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4.r,
                offset: Offset(2.w, 2.h),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search for a auction....',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp,
                      color: const Color(0xFF636E72),
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Container(
                width: 50.w,
                height: 60.h,
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF24439B),
                ),
                child: Center(
                  child: Icon(Icons.search, color: Colors.white, size: 28.sp),
                ),
              ),
            ],
          ),
        ),
        // Filter and Sort
        Row(
          children: [
            // Filter
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF333333),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48.r),
                ),
                elevation: 0,
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.filter_list, color: Colors.white, size: 28.sp),
                  SizedBox(width: 12.w),
                  Text(
                    'Filters',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AuctionCardGrid extends StatelessWidget {
  final List<Auction> auctions;
  const AuctionCardGrid({Key? key, required this.auctions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 4 columns, dynamic rows
    return LayoutBuilder(
      builder: (context, constraints) {
        final double minCardWidth = 320.w;
        final double spacing = 30.w;
        final double gridWidth = constraints.maxWidth;
        int crossAxisCount = (gridWidth / (minCardWidth + spacing)).floor();
        if (crossAxisCount < 1) crossAxisCount = 1;
        final double cardWidth =
            (gridWidth - (crossAxisCount - 1) * spacing) / crossAxisCount;
        final double cardHeight = 460.h;
        final double gridHeight = 2 * cardHeight + spacing;
        final int visibleItems = (crossAxisCount * 2).clamp(0, auctions.length);

        return SizedBox(
          width: double.infinity,
          height: gridHeight,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: spacing,
              crossAxisSpacing: spacing,
              childAspectRatio: cardWidth / cardHeight,
            ),
            itemCount: visibleItems,
            itemBuilder: (context, index) =>
                AuctionCard(auction: auctions[index]),
          ),
        );
      },
    );
  }
}

class AuctionCard extends StatelessWidget {
  final Auction auction;
  const AuctionCard({Key? key, required this.auction}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 395.w,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Stack(
        children: [
          // Main image
          ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: Image.asset(
              auction.imageUrl,
              width: 395.w,
              height: 232.h,
              fit: BoxFit.cover,
            ),
          ),
          // Heart icon
          Positioned(
            right: 20.w,
            top: 20.h,
            child: Container(
              width: 36.w,
              height: 36.h,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                auction.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: const Color(0xFFFF7675),
                size: 20.sp,
              ),
            ),
          ),
          // Gradient overlay for lower part of image
          Positioned(
            left: 0,
            right: 0,
            top: 170.h,
            height: 62.h,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x00000000),
                    Color(0xFF000000),
                  ],
                  stops: [0, 1],
                ),
              ),
            ),
          ),
          // Bid/Time overlay
          Positioned(
            left: 20.w,
            right: 20.w,
            top: 192.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Current Bid
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Current BID',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: const Color(0xFFF2F2F2),
                      ),
                    ),
                    Text(
                      auction.bid,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                        color: const Color(0xFFF2F2F2),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 2.w,
                  height: 58.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
                // Time Left
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Time Left',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: const Color(0xFFF2F2F2),
                      ),
                    ),
                    Text(
                      auction.timeLeft,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                        color: const Color(0xFFF2F2F2),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Card content (bottom)
          Positioned(
            left: 20.w,
            right: 20.w,
            bottom: 10.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // White card
                Container(
                  width: 349.w,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile row
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 12.r,
                            backgroundImage: AssetImage(auction.userAvatarUrl),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            auction.userName,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: const Color(0xFF333333),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      // Title
                      Text(
                        auction.title,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: const Color(0xFF121212),
                        ),
                      ),
                      // Subtitle
                      Text(
                        auction.subtitle,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,
                          fontSize: 16.sp,
                          color: const Color(0xFF333333),
                        ),
                      ),
                      // Estimate
                      Text(
                        auction.estimate,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: const Color(0xFF333333),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                // Location row
                Row(
                  children: [
                    Icon(Icons.location_on,
                        size: 16.sp, color: const Color(0xFFF2F2F2)),
                    SizedBox(width: 8.w),
                    Text(
                      auction.location,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: const Color(0xFFF2F2F2),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ForumsSection extends StatelessWidget {
  const ForumsSection({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Forums Section',
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
    );
  }
}


