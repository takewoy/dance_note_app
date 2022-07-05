import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:photo_view/photo_view.dart';
import 'package:universal_io/io.dart';

import '../../../../utils/util.dart';
import '../controller/edit_form_controller.dart';

class PicsSelectCard extends ConsumerWidget {
  const PicsSelectCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(editFormProvider.notifier);
    final picOne = ref.watch(editFormProvider.select((s) => s.picOne));
    final picTwo = ref.watch(editFormProvider.select((s) => s.picTwo));
    final picThree = ref.watch(editFormProvider.select((s) => s.picThree));
    final picFour = ref.watch(editFormProvider.select((s) => s.picFour));

    return LayoutBuilder(
      builder: (_, constraints) {
        // 画面の横幅に合わせてグリッドの数を変更する
        if (constraints.maxWidth <= 834) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  _PicBox(
                    pic: picOne,
                    select: notifier.setPicOne,
                    delete: notifier.deletePicOne,
                  ),
                  const Gap(5),
                  _PicBox(
                    pic: picTwo,
                    select: notifier.setPicTwo,
                    delete: notifier.deletePicTwo,
                  ),
                ],
              ),
              const Gap(5),
              Row(
                children: [
                  _PicBox(
                    pic: picThree,
                    select: notifier.setPicThree,
                    delete: notifier.deletePicThree,
                  ),
                  const Gap(5),
                  _PicBox(
                    pic: picFour,
                    select: notifier.setPicFour,
                    delete: notifier.deletePicFour,
                  ),
                ],
              ),
            ],
          );
        } else {
          return Row(
            children: [
              _PicBox(
                pic: picOne,
                select: notifier.setPicOne,
                delete: notifier.deletePicOne,
              ),
              const Gap(5),
              _PicBox(
                pic: picTwo,
                select: notifier.setPicTwo,
                delete: notifier.deletePicTwo,
              ),
              const Gap(5),
              _PicBox(
                pic: picThree,
                select: notifier.setPicThree,
                delete: notifier.deletePicThree,
              ),
              const Gap(5),
              _PicBox(
                pic: picFour,
                select: notifier.setPicFour,
                delete: notifier.deletePicFour,
              ),
            ],
          );
        }
      },
    );
  }
}

/// [GridView]で表示する写真を入れるカード
class _PicBox extends ConsumerWidget {
  const _PicBox({
    required this.pic,
    required this.select,
    required this.delete,
  });

  final String pic;
  final Future<void> Function(ImageSource source) select;
  final Future<void> Function(String path) delete;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const radius = BorderRadius.all(Radius.circular(16));
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: InkWell(
          borderRadius: radius,
          onTap: () => showCupertinoModalPopup<void>(
            context: context,
            builder: (_) => _ImageSelectActionSheet(
              picPath: pic,
              select: select,
              delete: delete,
            ),
          ),
          child: Visibility(
            visible: pic.isNotEmpty,
            replacement: const Card(
              shape: RoundedRectangleBorder(borderRadius: radius),
              elevation: 4,
              child: Center(
                child: Icon(FluentIcons.image_24_regular),
              ),
            ),
            child: Card(
              shape: const RoundedRectangleBorder(borderRadius: radius),
              child: ClipRRect(
                borderRadius: radius,
                child: Image.file(
                  File(pic),
                  errorBuilder: (_, __, ___) => const _ErrIcon(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ImageSelectActionSheet extends ConsumerWidget {
  const _ImageSelectActionSheet({
    required this.picPath,
    required this.select,
    required this.delete,
  });

  final String picPath;
  final Future<void> Function(ImageSource source) select;
  final Future<void> Function(String path) delete;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ref.watch(isMobileProvider);
    void pop() => Navigator.of(context).pop();

    return CupertinoActionSheet(
      cancelButton: CupertinoActionSheetAction(
        isDestructiveAction: true,
        onPressed: pop,
        child: const Text('キャンセル'),
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () async {
            pop();
            await select(ImageSource.gallery);
          },
          child: const Text('ライブラリから選択'),
        ),
        // カメラでの撮影はモバイル端末のみで表示
        if (isMobile)
          CupertinoActionSheetAction(
            onPressed: () async {
              pop();
              await select(ImageSource.camera);
            },
            child: const Text('カメラで撮影'),
          ),
        // PhotoViewの表示と写真の削除ボタンは写真が存在する場合に表示
        if (picPath.isNotEmpty) ...[
          CupertinoActionSheetAction(
            onPressed: () {
              pop(); // ダイアログをとじる
              showMaterialModalBottomSheet<void>(
                context: context,
                shape: const RoundedRectangleBorder(),
                builder: (context) {
                  return Scaffold(
                    backgroundColor: Colors.black,
                    appBar: AppBar(
                      backgroundColor: Colors.black,
                      leading: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          FluentIcons.dismiss_24_regular,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    body: PhotoView(
                      imageProvider: FileImage(File(picPath)),
                      errorBuilder: (_, __, ___) => const _ErrIcon(),
                    ),
                  );
                },
              );
            },
            child: const Text('写真を表示'),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              pop();
              await delete(picPath);
            },
            child: const Text('写真を削除'),
          ),
        ],
      ],
    );
  }
}

/// 写真の表示に失敗したとき用のアイコン
class _ErrIcon extends StatelessWidget {
  const _ErrIcon();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        FluentIcons.error_circle_24_filled,
        color: Theme.of(context).colorScheme.error,
      ),
    );
  }
}
