// Moved from features/home/presentation/widgets/navbar.dart
// This is now a core widget for use across the app.

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppNavBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Color bgColor;
  const AppNavBar({Key? key, this.height = 80, this.bgColor = Colors.transparent}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: bgColor,
      padding: const EdgeInsets.symmetric(horizontal: 140),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Image.asset(
            'assets/images/osp-logo.png',
            height: 58,
          ),
          // Menu Buttons
          Row(
            children: [
              // Search Icon
              _CircleIcon(
                icon: Icons.search,
                background: const Color.fromRGBO(213, 152, 35, 0.2),
                iconColor: Colors.black87,
              ),
              const SizedBox(width: 24),
              // User Profile
              _ProfileMenu(),
              const SizedBox(width: 24),
              // Menu Button
              _MenuButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class _CircleIcon extends StatelessWidget {
  final IconData icon;
  final Color background;
  final Color iconColor;
  const _CircleIcon({required this.icon, required this.background, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(67),
      ),
      child: Icon(icon, color: iconColor, size: 24),
    );
  }
}

class _ProfileMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.account_circle, color: Colors.black87, size: 40);
  }
}

class _MenuButton extends StatelessWidget {
  const _MenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => const Placeholder(), // Replace with menu page
          ),
        );
      },
      child: Container(
        width: 141,
        height: 52,
        decoration: BoxDecoration(
          color: const Color(0xFF25B4DC),
          borderRadius: BorderRadius.circular(49),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.menu, color: Color(0xFF333333), size: 24),
            SizedBox(width: 10),
            Text(
              'Menu',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
