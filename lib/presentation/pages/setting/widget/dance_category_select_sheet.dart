import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../models/visible_dance/visible_dance.dart';
import '../../../common/leading_icon.dart';
import '../controller/visible_dance_controller.dart';

class DanceCategorySelectSheet extends ConsumerWidget {
  const DanceCategorySelectSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final danceCategories = ref.watch(visibleDanceProvider);
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _Header(),
              ...ListTile.divideTiles(
                context: context,
                tiles: danceCategories.map((dance) => _Tile(dance: dance)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

class _Tile extends ConsumerWidget {
  const _Tile({required this.dance});

  final VisibleDance dance;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(visibleDanceProvider.notifier);
    final danceCategories = ref.watch(visibleDanceProvider);
    final visibleDances = danceCategories.where((e) => e.visible);
    return ListTile(
      leading: LeadingIcon(icon: Text(dance.category.initial)),
      title: Text(dance.category.label),
      trailing: CupertinoSwitch(
        value: dance.visible,
        onChanged: (value) {
          if (!value && visibleDances.length == 1) {
            showCupertinoDialog<void>(
              context: context,
              builder: (_) => const _Dialog(),
            );
            return;
          }
          notifier.toggle(dance: dance, visible: value);
        },
      ),
    );
  }
}

class _Dialog extends StatelessWidget {
  const _Dialog();

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: const Text('全ての種目を非表示にすることはできません。'),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
