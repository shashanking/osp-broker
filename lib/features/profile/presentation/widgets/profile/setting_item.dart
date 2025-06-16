import 'package:flutter/material.dart';

enum SettingType { button, switch_, dropdown }

class SettingItem extends StatelessWidget {
  final String title;
  final String description;
  final SettingType type;
  final dynamic value;
  final IconData? icon;
  final VoidCallback? onPressed;
  final ValueChanged<bool>? onSwitchChanged;
  final ValueChanged<String?>? onDropdownChanged;
  final List<DropdownMenuItem<String>>? items;

  const SettingItem({
    Key? key,
    required this.title,
    required this.description,
    required this.type,
    this.value,
    this.icon,
    this.onPressed,
    this.onSwitchChanged,
    this.onDropdownChanged,
    this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon != null ? Icon(icon, size: 24) : null,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        description,
        style: const TextStyle(fontSize: 14, color: Colors.grey),
      ),
      // trailing: _buildTrailingWidget(),
      onTap: onPressed,
    );
  }

  Widget _buildTrailingWidget() {
    switch (type) {
      case SettingType.button:
        return TextButton(
          onPressed: onPressed,
          child: Text(
            value ?? 'Action',
            style: const TextStyle(color: Colors.blue),
          ),
        );
      case SettingType.switch_:
        return Switch(
          value: value as bool? ?? false,
          onChanged: onSwitchChanged,
          activeColor: Colors.blue,
        );
      case SettingType.dropdown:
        return DropdownButton<String>(
          value: value as String?,
          onChanged: onDropdownChanged,
          items: items,
          underline: const SizedBox(),
        );
    }
  }
}
