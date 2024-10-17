import 'package:flutter/material.dart';

class ColoredContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  const ColoredContainer({super.key, required this.child, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color.withOpacity(0.1),
      ),
      child: child,
    );
  }
}
