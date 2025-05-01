import 'package:flutter/material.dart';
import 'package:osp_broker/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool multiLine;
  const ContactRow({required this.icon, required this.text, this.multiLine = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
          multiLine ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Icon(icon, color: AppColors.menuText, size: 20.w),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              fontSize: 20.sp,
              color: multiLine ? AppColors.light : AppColors.menuText,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
