import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../extensions/theme_mode_x.dart';
import '../controller/theme_mode_controller.dart';

class ThemeSelectSheet extends ConsumerWidget {
  const ThemeSelectSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeModeProvider);
    final themeNotifier = ref.watch(themeModeProvider.notifier);
    void pop() => Navigator.of(context).pop();
    return CupertinoActionSheet(
      cancelButton: CupertinoActionSheetAction(
        isDestructiveAction: true,
        onPressed: pop,
        child: const Text('キャンセル'),
      ),
      actions: [
        for (final mode in ThemeMode.values)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 現在設定されているThemeModeにチェックを入れる
              if (currentTheme == mode)
                const Icon(FluentIcons.checkmark_24_regular),
              CupertinoActionSheetAction(
                onPressed: () {
                  themeNotifier.setTheme(mode);
                  pop();
                },
                child: Text(mode.label),
              ),
            ],
          ),
      ],
    );
  }
}
