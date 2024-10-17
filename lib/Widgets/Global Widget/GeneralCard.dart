import '../../Constants/colors.dart';
import 'package:flutter/material.dart';

class GeneralCard extends StatefulWidget {
  final Widget child;
  final bool showShadow;
  const GeneralCard({
    super.key,
    required this.child,
    this.showShadow = true,
  });

  @override
  State<GeneralCard> createState() => _GeneralCardState();
}

class _GeneralCardState extends State<GeneralCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: ConstantColors.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ConstantColors.borderGrey,
          ),
          boxShadow: widget.showShadow
              ? const [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 6,
                    spreadRadius: -4,
                    blurStyle: BlurStyle.solid,
                  ),
                ]
              : null,
        ),
        child: widget.child,
      ),
    );
  }
}
