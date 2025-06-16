import 'package:flutter/material.dart';

class StatsChip extends StatelessWidget {
  final String label;
  final String value;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;

  const StatsChip({
    Key? key,
    required this.label,
    required this.value,
    this.backgroundColor,
    this.textStyle,
    this.padding,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFF232323),
        borderRadius: borderRadius ?? BorderRadius.circular(30),
      ),
      child: Text(
        '$label: $value',
        style: textStyle ??
            const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 14,
            ),
      ),
    );
  }
}
