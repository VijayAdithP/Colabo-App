import 'package:colabomobileapp/Constants/TextThemes.dart';
import 'package:colabomobileapp/Constants/colors.dart';
import 'package:flutter/material.dart';

class ResetAndApply extends StatefulWidget {
  final String text1;
  final String text2;
  const ResetAndApply({super.key, required this.text1, required this.text2});

  @override
  State<ResetAndApply> createState() => _ResetAndApplyState();
}

class _ResetAndApplyState extends State<ResetAndApply> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: ConstantColors.borderGrey,
                ),
                borderRadius: BorderRadius.circular(
                  10,
                ),
                color: Colors.transparent,
              ),
              child: Center(
                child: Text(
                  widget.text1,
                  style: AppTextTheme.allTextTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                color: ConstantColors.primaryGreen,
              ),
              child: Center(
                child: Text(
                  widget.text2,
                  style: AppTextTheme.allTextTheme.labelLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
