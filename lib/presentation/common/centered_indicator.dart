import 'package:flutter/material.dart';

class CenteredIndicator extends StatelessWidget {
  const CenteredIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
