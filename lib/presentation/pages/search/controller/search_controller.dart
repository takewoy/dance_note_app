import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 検索ワード
final filterWordProvider = StateProvider.autoDispose((_) => '');
