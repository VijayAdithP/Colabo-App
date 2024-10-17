import 'package:colabomobileapp/Constants/TextThemes.dart';
import 'package:colabomobileapp/Constants/colors.dart';
import 'package:colabomobileapp/Widgets/Global%20Widget/ProgressIndicator.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class GoalHiearchyList extends StatelessWidget {
  final int index;
  const GoalHiearchyList({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (index != 0)
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              left: 35,
            ),
            child: DottedLine(
              dashRadius: 20,
              lineThickness: 2,
              dashLength: 2,
              dashGapLength: 2,
              dashColor: ConstantColors.borderGrey,
            ),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: index < 3 ? Colors.white : Colors.transparent,
                border: Border.all(
                  color: index < 3
                      ? ConstantColors.borderGrey
                      : Colors.transparent,
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                color: index < 3 ? Colors.black : Colors.transparent,
                Icons.keyboard_arrow_down,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Something something something something something something something",
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppTextTheme.allTextTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: index == 0
                          ? ConstantColors.primaryGreen
                          : Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              (index == 0 || index == 2) ? "Product" : "Sprint",
                              style: AppTextTheme.allTextTheme.labelSmall!
                                  .copyWith(
                                color: ConstantColors.commonTextColor,
                              ),
                            ),
                            Progressindicator(
                              backAndTextColor: (index == 1 || index == 3)
                                  ? Colors.red
                                  : ConstantColors.primaryBlandGreen,
                              indicatorRadius: 17,
                              progressCent: 34,
                              progressColor: ConstantColors.primaryLightGreen,
                              progressLineWidth: 3,
                              text: (index == 1 || index == 3)
                                  ? "At Risk"
                                  : "On Track",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
