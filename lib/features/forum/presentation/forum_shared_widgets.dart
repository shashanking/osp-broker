import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

/// Shared: Categories List
class CategoriesList extends StatelessWidget {
  final List<String> categories;
  final void Function(String category)? onCategoryTap;
  final Map<String, IconData> categoryIcons;

  CategoriesList({
    Key? key,
    required this.categories,
    this.onCategoryTap,
    Map<String, IconData>? categoryIcons,
  })  : categoryIcons = categoryIcons ??
            const {
              'jobs': Icons.groups,
              'Services': Icons.settings,
              'Machines': Icons.precision_manufacturing,
              'Auctions': Icons.gavel, 
            },
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: const Color(0xFFEBE6DC),
        border: Border.all(color: const Color(0xFFC8C8C8), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w800,
              fontSize: 28.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 18.h),
          Container(
            // height: 0.78.sh,
            child: ListView(
              shrinkWrap: true,
              children: [
                ...categories.map(
                  (cat) => Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: GestureDetector(
                      onTap: () => onCategoryTap?.call(cat),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F7F7),
                          border: Border.all(
                              color: const Color(0xFFC8C8C8), width: 1),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 6.h, horizontal: 12.w),
                        child: Row(
                          children: [
                            Container(
                              width: 44.w,
                              height: 44.w,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                              child: Icon(
                                categoryIcons[cat] ?? Icons.category,
                                color: Colors.white,
                                size: 24.sp,
                              ),
                            ),
                            SizedBox(width: 22.w),
                            Text(
                              cat,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 20.sp,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

/// Shared: Event Calendar
class EventCalendar extends StatelessWidget {
  const EventCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFFEBE6DC),
        border: Border.all(color: const Color(0xFFC8C8C8), width: 1),
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Event Calendar',
                style: TextStyle(
                  fontFamily: 'Basement Grotesque',
                  fontWeight: FontWeight.w800,
                  fontSize: 24.sp,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              color: const Color(0xFFEBE6DC),
              border: Border.all(color: const Color(0xFFC8C8C8), width: 1),
              borderRadius: BorderRadius.circular(13.r),
            ),
            child: Column(
              children: [
                // Calendar grid
                TableCalendar(
                  rowHeight: 44.h,
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: DateTime.now(),
                  headerVisible: true,
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: const Color(0xFF24439B),
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    defaultTextStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                    weekendTextStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                      color: Colors.black,
                    ),
                    weekendStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                      color: Colors.black,
                    ),
                  ),
                  calendarFormat: CalendarFormat.month,
                  availableGestures: AvailableGestures.horizontalSwipe,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  calendarBuilders: CalendarBuilders(
                    markerBuilder: (context, day, events) => null,
                  ),
                  onDaySelected: (selectedDay, focusedDay) {},
                  selectedDayPredicate: (day) => false,
                ),
                SizedBox(height: 18.h),
                // Join Button
                // Center(
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: const Color(0xFF24439B),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(26.r),
                //       ),
                //       padding: EdgeInsets.symmetric(
                //           horizontal: 32.w, vertical: 10.h),
                //     ),
                //     onPressed: () {},
                //     child: Text(
                //       'Join',
                //       style: TextStyle(
                //         fontFamily: 'Nunito Sans',
                //         color: Colors.white,
                //         fontSize: 16.sp,
                //         fontWeight: FontWeight.w400,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Shared: Poll Section
class PollSection extends StatelessWidget {
  const PollSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFFEBE6DC),
        border: Border.all(color: const Color(0xFFC8C8C8), width: 1),
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
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
      ),
    );
  }
}
