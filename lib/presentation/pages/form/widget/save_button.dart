import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/common_button.dart';
import '../../../router/router.dart';
import '../controller/edit_form_controller.dart';

class SaveButton extends ConsumerWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final notifier = ref.watch(editFormProvider.notifier);

    return CommonButton(
      onPressed: () async {
        final result = await notifier.save();
        if (result) {
          router.pop();
        }
      },
      label: 'Save',
    );
  }
}
