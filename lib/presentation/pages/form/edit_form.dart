import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../repositories/isar/dance_note/dance_note.dart';
import '../../../repositories/isar/isar.dart';
import '../../../utils/util.dart';
import '../../common/common_widgets.dart';
import '../../router/router.dart';
import 'controller/edit_form_controller.dart';
import 'widget/category_select_tile.dart';
import 'widget/note_form.dart';
import 'widget/pic_select_card.dart';
import 'widget/save_button.dart';

class EditForm extends HookConsumerWidget {
  const EditForm({super.key});
  static const routeName = 'edit-form';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final note = ref.watch(editNoteProvider);
    final isEdit = note != null;

    return UnfocusOnTap(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: router.pop,
            icon: const Icon(FluentIcons.dismiss_24_regular),
          ),
          title: Text(isEdit ? '編集' : '新規作成'),
          actions: isEdit
              ? [
                  // 編集時は共有/削除ボタンを表示する
                  IconButton(
                    tooltip: '共有',
                    onPressed: () => ref.read(shareNoteProvider)(note),
                    color: Colors.green.shade300,
                    icon: const Icon(FluentIcons.share_ios_24_filled),
                  ),
                  const Gap(5),
                  IconButton(
                    tooltip: '削除',
                    onPressed: () => showCupertinoDialog<void>(
                      context: context,
                      builder: (_) => _DeleteDialog(note: note),
                    ),
                    color: Theme.of(context).colorScheme.error,
                    icon: const Icon(FluentIcons.delete_24_filled),
                  ),
                  const Gap(5),
                ]
              : null,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _Title(title: '種目を選択'),
              CategorySelectTile(),
              Gap(10),
              _Title(title: 'Noteを記入'),
              NoteForm(),
              Gap(10),
              _Title(title: '写真'),
              PicsSelectCard(),
              Gap(10),
              Gap(30),
              SaveButton(),
              Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}

/// 削除の確認用ダイアログ
class _DeleteDialog extends ConsumerWidget {
  const _DeleteDialog({required this.note});

  final DanceNote note;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    void pop() => Navigator.of(context).pop();

    return CupertinoAlertDialog(
      title: const Text('本当に削除しますか？'),
      actions: [
        CupertinoDialogAction(
          onPressed: pop,
          child: const Text('キャンセル'),
        ),
        CupertinoDialogAction(
          onPressed: () async {
            final result = await ref.read(deleteDanceNoteProvider)(note);
            if (result) {
              router.pop(); // 元のページに戻る
            } else {
              ref.read(showSnackBarProvider)(
                '削除できませんでした。',
                useErrorColor: true,
              );
              pop(); // ダイアログをとじる
            }
          },
          isDestructiveAction: true,
          child: const Text('削除'),
        ),
      ],
    );
  }
}
