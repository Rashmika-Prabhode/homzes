import 'package:flutter/material.dart';

class RowSpacer extends StatelessWidget {
  const RowSpacer(this.size, {super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * size,
    );
  }
}
