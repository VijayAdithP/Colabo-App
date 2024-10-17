import 'dart:ui';

import 'package:colabomobileapp/Constants/colors.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  final Widget child;
  const BottomSheetWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 3,
        sigmaY: 3,
      ),
      child: Wrap(children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: ConstantColors.borderGrey2,
            ),
            child: child,
          ),
        ),
      ]),
    );
  }
}
