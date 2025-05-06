import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuctionBiddingSection extends StatelessWidget {
  final List<Map<String, dynamic>> auctionData;
  const AuctionBiddingSection({Key? key, required this.auctionData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      decoration: BoxDecoration(
        color: const Color(0xFFEBE6DC),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF232323),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Topics',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                _headerCell('Author'),
                _headerCell('Replies'),
                _headerCell('Views'),
                _headerCell('Last Post'),
              ],
            ),
          ),
          Divider(height: 1, color: const Color(0xFFE6E6E6)),
          ...List.generate(auctionData.length, (index) {
            final item = auctionData[index];
            return Column(
              children: [
                _auctionRow(
                  context,
                  isPinned: item['isPinned'] as bool,
                  isSolved: item['isSolved'] as bool,
                  topic: item['topic'] as String,
                  author: item['author'] as String,
                  replies: item['replies'] as int,
                  views: item['views'] as int,
                  lastPost: item['lastPost'] as String,
                  pageNumbers: List<String>.from(item['pageNumbers'] as List),
                ),
                if (index != auctionData.length - 1)
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: const Color(0xFFD1D1D1),
                  ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _headerCell(String text) {
    return Container(
      width: 90.w,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
        ),
      ),
    );
  }

  Widget _auctionRow(
    BuildContext context, {
    required bool isPinned,
    required bool isSolved,
    required String topic,
    required String author,
    required int replies,
    required int views,
    required String lastPost,
    required List<String> pageNumbers,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Topics + icons + page numbers
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      isPinned
                          ? Icons.push_pin
                          : isSolved
                              ? Icons.check_circle
                              : Icons.forum,
                      color: isPinned
                          ? Colors.red
                          : isSolved
                              ? Colors.green
                              : Colors.blue,
                      size: 18.sp,
                    ),
                    SizedBox(width: 6.w),
                    Flexible(
                      child: Text(
                        topic,
                        style: TextStyle(
                          color: const Color(0xFF24439B),
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                          decoration: TextDecoration.underline,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    ...pageNumbers.map((p) => Padding(
                          padding: EdgeInsets.only(right: 4.w),
                          child: Text(
                            p,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.sp,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
          // Author
          Container(
            width: 90.w,
            alignment: Alignment.center,
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Text(
                author,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // Replies
          Container(
            width: 90.w,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.forum, size: 18.sp, color: Colors.black54),
                SizedBox(width: 6.w),
                Text(
                  replies.toString(),
                  style: TextStyle(fontSize: 15.sp),
                ),
              ],
            ),
          ),
          // Views
          Container(
            width: 90.w,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.remove_red_eye, size: 18.sp, color: Colors.black54),
                SizedBox(width: 6.w),
                Text(
                  views.toString(),
                  style: TextStyle(fontSize: 15.sp),
                ),
              ],
            ),
          ),
          // Last Post
          Container(
            width: 90.w,
            alignment: Alignment.center,
            child: Text(
              lastPost,
              style: TextStyle(fontSize: 12.sp, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
