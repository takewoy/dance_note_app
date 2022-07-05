import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../enums/dance_category.dart';
import '../../setting/controller/visible_dance_controller.dart';
import '../controller/edit_form_controller.dart';

class CategorySelectTile extends ConsumerWidget {
  const CategorySelectTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visibleDances = ref.watch(visibleDanceProvider);
    final notifier = ref.watch(editFormProvider.notifier);
    final category = ref.watch(editFormProvider.select((s) => s.category));

    return Card(
      elevation: 1,
      child: InkWell(
        onTapDown: (details) async {
          final position = details.globalPosition;
          final result = await showMenu<DanceCategory>(
            context: context,
            position: RelativeRect.fromLTRB(
              position.dx,
              position.dy,
              position.dx,
              0,
            ),
            items: [
              for (final dance in visibleDances)
                if (dance.visible)
                  PopupMenuItem(
                    value: dance.category,
                    child: Text(dance.category.label),
                  ),
            ],
          );
          if (result != null) {
            notifier.setCategory(result);
          }
        },
        child: ListTile(
          leading: const Text('種目'),
          title: Text(category.label),
          trailing: const Icon(FluentIcons.more_vertical_24_regular),
        ),
      ),
    );
  }
}
