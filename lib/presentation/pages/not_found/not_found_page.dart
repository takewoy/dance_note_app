import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../common/common_button.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});
  static const routeName = 'not-found';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Not found.'),
            const Gap(20),
            CommonButton(
              onPressed: () => context.pop(),
              label: 'Go back',
            ),
          ],
        ),
      ),
    );
  }
}
