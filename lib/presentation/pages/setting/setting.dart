import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../router/router.dart';
import 'widget/dance_category_select_sheet.dart';
import 'widget/setting_tile.dart';
import 'widget/theme_select_sheet.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});
  static const routeName = 'setting';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: router.pop,
          icon: const Icon(FluentIcons.dismiss_24_regular),
        ),
        title: const Text('Setting'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: ListTile.divideTiles(
            context: context,
            tiles: [
              SettingTile(
                icon: FluentIcons.lightbulb_24_regular,
                title: 'アプリのテーマ変更',
                onTap: () => showCupertinoModalPopup<void>(
                  context: context,
                  builder: (_) => const ThemeSelectSheet(),
                ),
              ),
              SettingTile(
                icon: FluentIcons.person_lightbulb_24_regular,
                title: '表示する種目を選択',
                onTap: () => showCupertinoModalBottomSheet<void>(
                  context: context,
                  builder: (_) => const DanceCategorySelectSheet(),
                ),
              ),
              SettingTile(
                icon: FluentIcons.note_24_regular,
                title: 'ライセンス',
                onTap: () => showLicensePage(context: context),
              ),
            ],
          ).toList(),
        ),
      ),
    );
  }
}
