import 'package:flutter/material.dart';

class LeadingIcon extends StatelessWidget {
  const LeadingIcon({
    super.key,
    required this.icon,
  });

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      foregroundColor: Colors.white,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      child: icon,
    );
  }
}
