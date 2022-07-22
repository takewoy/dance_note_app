import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../repositories/isar/isar.dart';
import '../../common/common_widgets.dart';
import '../home/controller/home_controller.dart';
import '../home/widget/note_tile.dart';
import 'controller/search_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  static const routeName = 'search';

  @override
  Widget build(BuildContext context) {
    return UnfocusOnTap(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => GoRouter.of(context).pop(),
            icon: const Icon(FluentIcons.chevron_left_24_regular),
          ),
          title: const _SearchField(),
        ),
        body: const _SearchResult(),
      ),
    );
  }
}

/// [SearchPage]で検索ワードを入力するフォーム
class _SearchField extends ConsumerWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    const border = UnderlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );

    return TextField(
      autofocus: true,
      decoration: InputDecoration(
        focusedBorder: border,
        enabledBorder: border,
        hintText: 'ノートを検索',
        fillColor: isDark ? Colors.grey.shade900 : Colors.grey.shade100,
      ),
      onChanged: (text) {
        ref.read(filterWordProvider.notifier).update((_) => text);
      },
    );
  }
}

/// [SearchPage]の検索結果を表示する
class _SearchResult extends ConsumerWidget {
  const _SearchResult();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterWord = ref.watch(filterWordProvider);
    final filteredNote = ref.watch(filteredIsarDanceNoteProvider(filterWord));
    return Visibility(
      visible: filterWord.isNotEmpty,
      child: filteredNote.maybeWhen(
        data: (data) {
          if (data.isEmpty) {
            return const Center(child: Text('Not found.'));
          }
          return ListView.separated(
            itemCount: data.length,
            separatorBuilder: (_, __) => const CommonDivider(),
            itemBuilder: (_, index) => ProviderScope(
              overrides: [
                indexedNoteProvider.overrideWithValue(data[index]),
              ],
              child: const NoteTile(),
            ),
          );
        },
        orElse: CenteredIndicator.new,
      ),
    );
  }
}
