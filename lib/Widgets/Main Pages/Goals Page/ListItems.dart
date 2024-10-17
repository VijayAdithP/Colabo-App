import 'package:colabomobileapp/Constants/ConstantText.dart';
import 'package:colabomobileapp/Constants/TextThemes.dart';
import 'package:colabomobileapp/Pages/Main%20Pages/Goals%20Screen/GoalsDetails.dart';
import 'package:colabomobileapp/Widgets/Global%20Widget/ProgressIndicator.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomListItem extends StatelessWidget {
  final String mainText;
  final double progressPercent;
  final Color progressColor;
  final Color backAndTextColor;
  final bool isStarred;
  final String progressText;
  final double indicatorRadius;
  final double progressLineWidth;
  final bool showIndicator;
  final bool showText;
  final double textOnlyContinerHeight;

  // Constructor
  const CustomListItem(
      {super.key,
      required this.mainText,
      required this.progressPercent,
      required this.progressColor,
      required this.backAndTextColor,
      required this.isStarred,
      required this.progressText,
      required this.indicatorRadius,
      this.showIndicator = true,
      this.showText = true,
      required this.progressLineWidth,
      this.textOnlyContinerHeight = 0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const GoalsDetails()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        mainText,
                        style: AppTextTheme.allTextTheme.titleMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.info_outline,
                          size: 18,
                          color: Colors.grey,
                        ),
                        Icon(
                          size: 21,
                          isStarred ? Icons.star_rounded : Icons.star_outline,
                          color: isStarred ? Colors.amber : Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Text(
                  ConstantText.GoalType,
                  style: AppTextTheme.allTextTheme.labelSmall!.copyWith(
                    color: HexColor("#8D8D8D"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Progressindicator(
              textOnlyContinerHeight: textOnlyContinerHeight,
              showIndicator: showIndicator,
              showText: showText,
              backAndTextColor: backAndTextColor,
              indicatorRadius: indicatorRadius,
              progressCent: progressPercent,
              progressColor: progressColor,
              progressLineWidth: progressLineWidth,
              text: progressText,
            ),
          ],
        ),
      ),
    );
  }
}
