import 'package:flutter/material.dart';

/// キーボードの外側をタップしたらFocusを外したい時に使用する
class UnfocusOnTap extends StatelessWidget {
  const UnfocusOnTap({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}
