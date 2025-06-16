import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;

  const SectionHeading(
    this.text, {
    Key? key,
    this.style,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
        text,
        style: style ??
            const TextStyle(
              fontFamily: 'Basement Grotesque',
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Color(0xFF232323),
            ),
      ),
    );
  }
}
