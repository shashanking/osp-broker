import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:osp_broker/core/widgets/navbar.dart';

import 'forum_shared_widgets.dart';
import 'forum_forum_stats_row.dart';
import 'thread_list_page.dart';
import 'package:osp_broker/features/forum/domain/entities/category.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Announcements',
      'Popular',
      'Hot',
      'Auctions',
      'RFP',
      'Diamond membership channel',
      'Bidding for Beginners',
      'Creative Conference',
      'Games',
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFEBE6DC),
      body: Column(
        children: [
          const AppNavBar(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Panel: Categories
              SizedBox(
                width: 0.25.sw,
                // height: 0.90.sh,
                child: Container(
                  margin: EdgeInsets.only(
                    left: 32.w,
                    bottom: 16.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: CategoriesList(
                    categories: categories,
                    onCategoryTap: (cat) {
                      // TODO: Navigate to threads list for this category
                    },
                  ),
                ),
              ),
              // Center Panel: Forum content
              Container(
                width: 0.5.sw,
                height: 0.88.sh,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _AnnouncementsSection(),
                        SizedBox(height: 24.h),
                        const _ExclusiveForumsSection(),
                        SizedBox(height: 24.h),
                        const _PublicForumsSection(),
                      ],
                    ),
                  ),
                ),
              ),
              // Right Panel: Calendar & Poll
              SizedBox(
                width: 0.25.sw,
                child: Container(
                  margin: EdgeInsets.only(
                    right: 32.w,
                  ),
                  // padding: EdgeInsets.all(24.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Column(
                    children: const [
                      EventCalendar(),
                      SizedBox(height: 32),
                      PollSection(),
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

class _AnnouncementsSection extends StatelessWidget {
  const _AnnouncementsSection();

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with actual announcement data
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFEBE6DC),
        border: Border.all(color: const Color(0xFFC8C8C8), width: 1),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
            decoration: BoxDecoration(
              color: const Color(0xFF24439B),
              // border radius will be top left and bottom right 24 only
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                bottomRight: Radius.circular(24.r),
              ),
            ),
            child: Text('News',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 12.h),
          Container(
            margin: EdgeInsets.all(18.h),
            padding: EdgeInsets.all(18.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Announcements',
                    style: TextStyle(
                        fontSize: 18.sp, fontWeight: FontWeight.w700)),
                SizedBox(height: 6.h),
                Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc interdum egestas eleifend.',
                    style: TextStyle(fontSize: 15.sp)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ExclusiveForumsSection extends StatelessWidget {
  const _ExclusiveForumsSection();

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with actual exclusive forums data
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFFC8C8C8), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF25B4DC),
              border: Border.all(color: const Color(0xFFC8C8C8), width: 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                bottomRight: Radius.circular(24.r),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
            child: Text('Exclusive Forums',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 12.h),
          Container(
            margin: EdgeInsets.all(18.h),
            padding: EdgeInsets.all(18.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Diamond membership channel',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700)),
                          SizedBox(height: 6.h),
                          Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc interdum egestas eleifend.',
                              style: TextStyle(fontSize: 15.sp)),
                        ],
                      ),
                    ),
                    ForumStatsRow(
                      topics: 323,
                      posts: 3443,
                      lastPost: '12-04-2024\n2:34 PM',
                      moderator: 'Jeff',
                      highlight: false,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _PublicForumsSection extends StatelessWidget {
  const _PublicForumsSection();

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with actual public forums data
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFFC8C8C8), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF25B49B),
              border: Border.all(color: const Color(0xFFC8C8C8), width: 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                bottomRight: Radius.circular(24.r),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
            child: Text('Public Forums',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 12.h),
          ...[
            GestureDetector(
              onTap: () {
                context.go('/thread-list', extra: Category(id: 'auctions', name: 'Auctions & Bidding'));
              },
              child: Container(
                margin: EdgeInsets.all(18.h),
                padding: EdgeInsets.all(18.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('🔥 Auctions & Bidding',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(height: 6.h),
                              Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc interdum egestas eleifend.',
                                  style: TextStyle(fontSize: 15.sp)),
                            ],
                          ),
                        ),
                        ForumStatsRow(
                          topics: 434,
                          posts: 5677,
                          lastPost: '12-07-2024\n2:34 PM',
                          moderator: 'Steve',
                          highlight: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(18.h),
              padding: EdgeInsets.all(18.w),
              decoration: BoxDecoration(
                color: const Color(0xFFEBE6DC),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Lorem ipsum dolor sit',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700)),
                            SizedBox(height: 6.h),
                            Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc interdum egestas eleifend.',
                                style: TextStyle(fontSize: 15.sp)),
                          ],
                        ),
                      ),
                      ForumStatsRow(
                        topics: 34,
                        posts: 567,
                        lastPost: '14-07-2024\n9:34 PM',
                        moderator: 'Roger',
                        highlight: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(18.h),
              padding: EdgeInsets.all(18.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Bidding for Beginners',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700)),
                            SizedBox(height: 6.h),
                            Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc interdum egestas eleifend.',
                                style: TextStyle(fontSize: 15.sp)),
                          ],
                        ),
                      ),
                      ForumStatsRow(
                        topics: 434,
                        posts: 5677,
                        lastPost: '12-07-2024\n2:34 PM',
                        moderator: 'Steve',
                        highlight: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(18.h),
              padding: EdgeInsets.all(18.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Lorem ipsum dolor sit',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700)),
                            SizedBox(height: 6.h),
                            Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc interdum egestas eleifend.',
                                style: TextStyle(fontSize: 15.sp)),
                          ],
                        ),
                      ),
                      ForumStatsRow(
                        topics: 34,
                        posts: 567,
                        lastPost: '14-07-2024\n9:34 PM',
                        moderator: 'Roger',
                        highlight: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(18.h),
              padding: EdgeInsets.all(18.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Lorem ipsum dolor sit',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700)),
                            SizedBox(height: 6.h),
                            Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc interdum egestas eleifend.',
                                style: TextStyle(fontSize: 15.sp)),
                          ],
                        ),
                      ),
                      ForumStatsRow(
                        topics: 34,
                        posts: 567,
                        lastPost: '14-07-2024\n9:34 PM',
                        moderator: 'Roger',
                        highlight: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _EventCalendar extends StatelessWidget {
  const _EventCalendar();

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with actual calendar widget
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Event Calendar',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
            Text('Edit', style: TextStyle(fontSize: 14.sp, color: Colors.blue)),
          ],
        ),
        SizedBox(height: 8.h),
        Container(
          height: 240.h,
          color: const Color(0xFFF7F7F7),
          child: const Center(child: Text('Calendar Widget Placeholder')),
        ),
      ],
    );
  }
}

class _PollSection extends StatelessWidget {
  const _PollSection();
  @override
  Widget build(BuildContext context) {
    // TODO: Replace with actual poll widget
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Poll',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 8.h),
        Container(
          color: const Color(0xFFF7F7F7),
          padding: EdgeInsets.all(16.w),
          child: const Text('How many auctions have you participated in?'),
        ),
        SizedBox(height: 8.h),
        ElevatedButton(onPressed: () {}, child: const Text('Vote')),
      ],
    );
  }
}
