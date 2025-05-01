import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router/go_router.dart';
import '../../features/menu/application/menu_notifier.dart';

class AppNavBar extends ConsumerWidget implements PreferredSizeWidget {
  final double height;
  final Color bgColor;
  const AppNavBar(
      {Key? key, this.height = 80, this.bgColor = Colors.transparent})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuState = ref.watch(menuNotifierProvider);
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
              _MenuButton(activeMenu: menuState.selectedMenu),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;
  const _NavButton({
    required this.label,
    required this.onTap,
    this.color = const Color(0xFF24439B),
    this.textColor = const Color(0xFFEBE6DC),
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Basement Grotesque',
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class _CircleIcon extends StatelessWidget {
  final IconData icon;
  final Color background;
  final Color iconColor;
  const _CircleIcon({
    required this.icon,
    required this.background,
    required this.iconColor,
  });
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
    return Row(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF24439B), Color(0xFF15A5CD)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
              radius: 22,
            ),
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'Jeremy Warner',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: Color(0xFF121212),
          ),
        ),
        const SizedBox(width: 10),
        const Icon(Icons.keyboard_arrow_down,
            color: Color(0xFF121212), size: 24),
      ],
    );
  }
}

class _MenuButton extends StatelessWidget {
  final String activeMenu;
  const _MenuButton({Key? key, required this.activeMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/menu');
      },
      child: Container(
        width: 120,
        height: 52,
        decoration: BoxDecoration(
          color: const Color(0xFF25B4DC),
          borderRadius: BorderRadius.circular(49),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.menu, color: Color(0xFF333333), size: 24),
            const SizedBox(width: 10),
            const Text(
              'Menu',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            // const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
