import 'package:flutter/material.dart';

class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 10);
  }
}

class HorizontalSpacing extends StatelessWidget {
  const HorizontalSpacing({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 10);
  }
}
