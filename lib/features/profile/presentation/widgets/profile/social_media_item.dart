import 'package:flutter/material.dart';

class SocialMediaItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback? onTap;
  final double iconSize;
  final double spacing;

  const SocialMediaItem({
    Key? key,
    required this.iconPath,
    required this.label,
    this.onTap,
    this.iconSize = 24.0,
    this.spacing = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            iconPath,
            width: iconSize,
            height: iconSize,
            errorBuilder: (context, error, stackTrace) => Icon(
              Icons.error_outline,
              size: iconSize,
            ),
          ),
          SizedBox(width: spacing),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
