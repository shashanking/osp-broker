import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../domain/entities/thread.dart';
import '../domain/entities/comment.dart';
import 'forum_shared_widgets.dart';

/// Displays a single thread with comments, left & right panels persistent.
class ThreadPage extends StatelessWidget {
  final Thread thread;
  final List<Comment> comments;
  const ThreadPage({Key? key, required this.thread, required this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBE6DC),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
          // Left Panel: Categories (reuse)
          SizedBox(
            width: 300.w,
            child: Container(
              margin: EdgeInsets.only(top: 32.h, left: 32.w, bottom: 32.h),
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: CategoriesList(
                categories: const [
                  'Announcements',
                  'Popular',
                  'Hot',
                  'Auctions',
                  'RFP',
                  'Diamond membership channel',
                  'Bidding for Beginners',
                  'Creative Conference',
                  'Games',
                ],
                onCategoryTap: (cat) {
                  // TODO: Navigate to threads list for this category
                },
              ),
            ),
          ),
          // Center Panel: Thread Content & Comments
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(thread.title, style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w800, fontFamily: 'Montserrat')),
                    SizedBox(height: 12.h),
                    Text(thread.body, style: TextStyle(fontSize: 16.sp)),
                    SizedBox(height: 32.h),
                    Text('Comments', style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 12.h),
                    ...comments.map((c) => Container(
                      margin: EdgeInsets.only(bottom: 12.h),
                      padding: EdgeInsets.all(14.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F7F7),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(c.author, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
                          SizedBox(height: 4.h),
                          Text(c.body, style: TextStyle(fontSize: 15.sp)),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ),
          // Right Panel: Calendar & Poll (reuse)
          SizedBox(
            width: 320.w,
            child: Container(
              margin: EdgeInsets.only(top: 32.h, right: 32.w, bottom: 32.h),
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
                ],
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
    );
  }
}
// TODO: Import and reuse _CategoriesList, _EventCalendar, _PollSection from forum_page.dart
