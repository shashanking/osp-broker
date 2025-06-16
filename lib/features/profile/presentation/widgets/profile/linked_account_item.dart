import 'package:flutter/material.dart';

class LinkedAccountItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final String actionLabel;
  final VoidCallback? onActionPressed;
  final double iconSize;

  const LinkedAccountItem({
    Key? key,
    required this.iconPath,
    required this.label,
    required this.actionLabel,
    this.onActionPressed,
    this.iconSize = 32.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        iconPath,
        width: iconSize,
        height: iconSize,
        errorBuilder: (context, error, stackTrace) => Icon(
          Icons.account_circle,
          size: iconSize,
        ),
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      trailing: TextButton(
        onPressed: onActionPressed,
        child: Text(
          actionLabel,
          style: const TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}
