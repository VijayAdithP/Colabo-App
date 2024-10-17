import 'package:colabomobileapp/Constants/TextThemes.dart';
import 'package:colabomobileapp/Constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class Emptyplaceholder extends StatelessWidget {
  final String text;
  final String createText;
  const Emptyplaceholder({
    super.key,
    required this.text,
    required this.createText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "asset/icons/empty goals.svg",
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          textAlign: TextAlign.center,
           text,
          style: AppTextTheme.allTextTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: ConstantColors.primaryLightGreen,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            child: Text(
              // "CREATE NEW GOAL",
              createText,
              style: AppTextTheme.allTextTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: ConstantColors.primaryLightGreen,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
