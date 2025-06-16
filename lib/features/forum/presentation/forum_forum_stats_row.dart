import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// ForumStatsRow: Displays topics, posts, last post date/time, and moderator in a pill-shaped row
class ForumStatsRow extends StatelessWidget {
  final int topics;
  final int posts;
  final String lastPost;
  final String moderator;
  final bool highlight;

  const ForumStatsRow({
    super.key,
    required this.topics,
    required this.posts,
    required this.lastPost,
    required this.moderator, 
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12.w, top: 6.h, bottom: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: highlight ? const Color(0xFFF5F6F9) : const Color(0xFFE7E5DF),
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _statCell(topics.toString()),
          _divider(),
          _statCell(posts.toString()),
          _divider(),
          _statCell(lastPost, align: TextAlign.center, width: 96.w),
          _divider(),
          _statCell(moderator, bold: true, width: 56.w),
        ],
      ),
    );
  }

  Widget _statCell(String text, {bool bold = false, double? width, TextAlign? align}) {
    return SizedBox(
      width: width ?? 44.w,
      child: Text(
        text,
        textAlign: align ?? TextAlign.center,
        style: TextStyle(
          fontFamily: 'Nunito Sans',
          fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
          fontSize: 14.sp,
          color: const Color(0xFF343434),
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7.w),
      width: 1.5.w,
      height: 24.h,
      color: const Color(0xFFD1D1D1),
    );
  }
}
