import '../../../Constants/TextThemes.dart';
import '../../../Constants/colors.dart';
import '../../Global%20Widget/ColoredContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CompletedActionsWidget extends StatefulWidget {
  const CompletedActionsWidget({super.key});

  @override
  State<CompletedActionsWidget> createState() => _CompletedActionsWidgetState();
}

class _CompletedActionsWidgetState extends State<CompletedActionsWidget> {
  @override
  Widget build(BuildContext context) {
    return ColoredContainer(
      color: ConstantColors.gold,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 5,
                  ),
                  child: SvgPicture.asset(
                    "asset/icons/gas-gold.svg",
                    height: 23,
                  ),
                ),
                FittedBox(
                  child: Text(
                    "Actions Completed",
                    style: AppTextTheme.allTextTheme.labelMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
            Text.rich(
              TextSpan(
                style: AppTextTheme.allTextTheme.labelSmall!.copyWith(
                  color: Colors.black,
                ),
                children: [
                  const TextSpan(text: '5'),
                  const TextSpan(text: "/"),
                  const TextSpan(text: "10"),
                  TextSpan(
                    text: "  >",
                    style: AppTextTheme.allTextTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
