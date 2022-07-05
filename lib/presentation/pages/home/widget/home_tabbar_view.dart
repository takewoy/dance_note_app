import 'package:dance_note_app/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/common_button.dart';
import '../../../common/common_divider.dart';
import '../../setting/controller/visible_dance_controller.dart';
import '../controller/home_controller.dart';
import 'note_tile.dart';

class HomeTabBarView extends ConsumerWidget {
  const HomeTabBarView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(visibleDanceProvider);
    final visibleCategories = categories.where((e) => e.visible);

    return TabBarView(
      children: visibleCategories.map((dance) {
        final notes = ref.watch(filteredDanceNoteProvider(dance.category));
        // エラーの時はnullが返ってくる
        if (notes == null) {
          return const _ErrorWidget();
        }
        // 何も登録されていない場合
        if (notes.isEmpty) {
          return const Center(child: Text('Not registered.'));
        }

        // 登録がある場合は`ListView.separated`で表示する
        // `NoteTile`をconstにするために`ProviderScope`でOverrideする
        return RefreshIndicator(
          onRefresh: () async {
            ref.read(showSnackBarProvider)('Refresh!!');
            ref
              ..invalidate(filteredDanceNoteProvider(dance.category))
              ..invalidate(danceNoteProvider);
          },
          child: ListView.separated(
            itemCount: notes.length,
            separatorBuilder: (_, __) => const CommonDivider(),
            itemBuilder: (_, index) => ProviderScope(
              overrides: [
                indexedNoteProvider.overrideWithValue(notes[index]),
              ],
              child: const NoteTile(),
            ),
          ),
        );
      }).toList(),
    );
  }
}

/// `danceNoteProvider`からエラーが返ってきた時に表示して
/// ボタンを押すと`ref.invalidate(danceNoteProvider)`を実行
class _ErrorWidget extends ConsumerWidget {
  const _ErrorWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          const Text('Error'),
          const Gap(20),
          CommonButton(
            onPressed: () => ref.invalidate(danceNoteProvider),
            label: 'Reload',
          ),
        ],
      ),
    );
  }
}
