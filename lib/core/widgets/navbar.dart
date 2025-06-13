import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/menu/application/menu_notifier.dart';
import '../../core/infrastructure/providers.dart';
import '../../core/infrastructure/base_api_service.dart';


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
    final authBox = ref.watch(authBoxProvider);
    final token = authBox.get('token');
    final fullName = authBox.get('fullName');
    print('[NAVBAR] Token: '
        '[33m$token[0m, Name: [36m$fullName[0m');
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



class _ProfileMenu extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authBox = ref.watch(authBoxProvider);
    final isLoggedIn = authBox.get('token') != null && (authBox.get('token') as String).isNotEmpty;
    if (!isLoggedIn) {
      return const SizedBox.shrink();
    }
    return Row(
      children: [
        GestureDetector(
          onTap: () async {
            final apiService = ref.read(baseApiServiceProvider);
            await apiService.clearAuthToken();
            // ignore: use_build_context_synchronously
            if (context.mounted) {
              context.go('/');
            }
            ref.invalidate(authBoxProvider); // force UI refresh
          },
          child: Container(
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
        ),
        const SizedBox(width: 10),
        Text(
          authBox.get('fullName', defaultValue: 'User') ?? 'User',
          style: const TextStyle(
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
        context.push('/menu');
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
