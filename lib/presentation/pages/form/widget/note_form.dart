import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../utils/util.dart';
import '../controller/edit_form_controller.dart';

/// DanceNoteのノート入力用
class NoteForm extends ConsumerWidget {
  const NoteForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(editFormProvider.notifier);
    final note = ref.watch(editFormProvider.select((s) => s.note));
    return Form(
      key: ref.watch(formKeyProvider),
      child: TextFormField(
        initialValue: note,
        maxLines: 10,
        decoration: const InputDecoration(
          labelText: 'Note',
        ),
        validator: ref.watch(inputValidatorProvider),
        onSaved: notifier.setNote,
      ),
    );
  }
}
