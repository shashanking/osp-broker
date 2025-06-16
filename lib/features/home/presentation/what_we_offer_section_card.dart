import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferCard extends StatefulWidget {
  final String icon;
  final String title;
  final String desc;
  const OfferCard({super.key,required this.icon, required this.title, required this.desc});

  @override
  State<OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final blueGradient = const LinearGradient(
      colors: [Color(0xFF24439B), Color(0xFF0A72B3)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    final whiteGradient = const LinearGradient(
      colors: [Colors.white, Colors.white],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    final activeGradient = _hovered ? blueGradient : whiteGradient;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: 360.w,
        height: 260.h,
        padding: EdgeInsets.all(28.w),
        decoration: BoxDecoration(
          gradient: activeGradient,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFFD59823), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: const Color(0x1AD59823),
              blurRadius: 8.r,
              offset: Offset(0, 4.h),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TweenAnimationBuilder<Color?>(
              tween: ColorTween(
                begin: const Color(0xFFD59823),
                end: _hovered ? Colors.white : const Color(0xFFD59823),
              ),
              duration: const Duration(milliseconds: 350),
              builder: (context, color, child) => Image.asset(
                widget.icon,
                width: 48.w,
                height: 48.w,
                fit: BoxFit.contain,
                color: color,
              ),
            ),
            SizedBox(height: 18.h),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 350),
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
                fontSize: 20.sp,
                color: _hovered ? Colors.white : const Color(0xFF121212),
              ),
              child: Text(widget.title),
            ),
            SizedBox(height: 12.h),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 350),
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: _hovered ? Colors.white : const Color(0xFF333333),
              ),
              child: Text(widget.desc),
            ),
          ],
        ),
      ),
    );
  }
}
