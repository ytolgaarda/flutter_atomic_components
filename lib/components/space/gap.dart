import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final double size;

  const Space(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
    );
  }
}
