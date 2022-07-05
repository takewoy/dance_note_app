import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../common/leading_icon.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: LeadingIcon(icon: Icon(icon)),
      title: Text(title),
      trailing: const Icon(FluentIcons.chevron_right_24_regular),
      onTap: onTap,
    );
  }
}
