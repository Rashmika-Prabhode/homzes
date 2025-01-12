import 'package:flutter/material.dart';

class ColumnSpacer extends StatelessWidget {
  const ColumnSpacer(this.size, {super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * size,
    );
  }
}
