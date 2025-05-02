import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osp_broker/core/widgets/navbar.dart';
import 'package:osp_broker/features/forum/domain/entities/category.dart';
import 'package:osp_broker/features/forum/domain/entities/thread.dart';
import 'package:osp_broker/features/forum/presentation/forum_shared_widgets.dart';

/// Displays a list of threads for a given category, with left & right panels persistent.
class ThreadListPage extends StatelessWidget {
  final Category category;
  final List<Thread> threads;
  const ThreadListPage(
      {Key? key, required this.category, required this.threads})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBE6DC),
      body: Column(
        children: [
          const AppNavBar(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Panel: Categories (reuse)
              SizedBox(
                width: 0.25.sw,
                child: Container(
                  margin: EdgeInsets.only(top: 32.h, left: 32.w, bottom: 32.h),
                  // padding: EdgeInsets.all(24.w),
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
              // Center Panel: Thread List
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(category.name,
                          style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Montserrat')),
                      SizedBox(height: 24.h),
                      ...threads.map((thread) => GestureDetector(
                            onTap: () {
                              // TODO: Navigate to single thread page
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 16.h),
                              padding: EdgeInsets.all(18.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.03),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(thread.title,
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 6.h),
                                  Text(thread.snippet,
                                      style: TextStyle(fontSize: 15.sp)),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              // Right Panel: Calendar & Poll (reuse)
              SizedBox(
                width: 0.25.sw,
                child: Container(
                  margin: EdgeInsets.only(top: 32.h, right: 32.w, bottom: 32.h),
                  padding: EdgeInsets.all(24.w),
                  decoration: BoxDecoration(
                    // color: Colors.white,
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

// TODO: Import and reuse _CategoriesList, _EventCalendar, _PollSection from forum_page.dart
