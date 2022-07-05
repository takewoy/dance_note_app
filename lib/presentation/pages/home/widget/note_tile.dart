import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../repositories/isar/isar.dart';
import '../../../../utils/util.dart';
import '../../../common/leading_icon.dart';
import '../../../router/router.dart';
import '../../form/edit_form.dart';
import '../controller/home_controller.dart';

/// 登録されている`DanceNote`を表示する
/// タップすると編集画面に遷移
class NoteTile extends ConsumerWidget {
  const NoteTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formatter = ref.watch(formatterProvider);
    final tabIndex = ref.watch(tabIndexProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final router = ref.watch(routerProvider);
    final note = ref.watch(indexedNoteProvider);

    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => ref.read(shareNoteProvider)(note),
            backgroundColor: Colors.green.shade300,
            foregroundColor: Colors.white,
            icon: FluentIcons.share_ios_24_filled,
            label: '共有',
          ),
          SlidableAction(
            onPressed: (_) async => ref.read(deleteDanceNoteProvider)(note),
            backgroundColor: colorScheme.error,
            foregroundColor: Colors.white,
            icon: FluentIcons.delete_24_filled,
            label: '削除',
          ),
        ],
      ),
      child: ListTile(
        leading: LeadingIcon(
          icon: Text(note.category.initial),
        ),
        title: Text(
          note.note,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(formatter.format(note.editedAt)),
        trailing: const Icon(FluentIcons.chevron_right_24_regular),
        onTap: () => router.goNamed(
          EditForm.routeName,
          params: {
            'id': note.id.toString(),
            'index': tabIndex.toString(),
          },
        ),
      ),
    );
  }
}
