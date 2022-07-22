import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/centered_indicator.dart';
import '../../router/router.dart';
import '../setting/controller/visible_dance_controller.dart';
import 'controller/home_controller.dart';
import 'widget/home_tabbar_view.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(tabIndexProvider);
    final dances = ref.watch(visibleDanceProvider);
    final visibleDances = dances.where((dance) => dance.visible);

    return DefaultTabController(
      initialIndex: tabIndex,
      length: visibleDances.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dance Note'),
          actions: [
            IconButton(
              tooltip: '検索',
              onPressed: () => const SearchPageRoute().go(context),
              icon: const Icon(FluentIcons.search_24_regular),
            ),
            const Gap(5),
            IconButton(
              tooltip: '設定',
              onPressed: () => const SettingPageRoute().go(context),
              icon: const Icon(FluentIcons.settings_24_regular),
            ),
            const Gap(5),
          ],
          bottom: TabBar(
            isScrollable: true,
            splashBorderRadius: BorderRadius.circular(16),
            onTap: (index) => ref.read(tabIndexProvider.notifier).state = index,
            tabs: [
              for (final dance in visibleDances)
                Tab(text: dance.category.label),
            ],
          ),
        ),
        // `danceNoteProvider`がAsyncLoadingの場合はインジケーターを表示する
        body: ref.watch(isLoadingNoteProvider)
            ? const CenteredIndicator()
            : const HomeTabBarView(),
        floatingActionButton: FloatingActionButton(
          heroTag: null,
          tooltip: '新規作成',
          onPressed: () => const EditFormRoute(id: 'add').go(context),
          child: const Icon(FluentIcons.add_24_regular),
        ),
      ),
    );
  }
}
