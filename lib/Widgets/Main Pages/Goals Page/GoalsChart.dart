import 'dart:math';

import '../../../Constants/TextThemes.dart';
import '../../../Constants/colors.dart';
import '../../Global%20Widget/ColoredContainer.dart';
import '../Goals%20Page/RadicalChart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class GoalsChart extends StatefulWidget {
  const GoalsChart({super.key});

  @override
  State<GoalsChart> createState() => _GoalsChartState();
}

class _GoalsChartState extends State<GoalsChart> {
  @override
  Widget build(BuildContext context) {
    return ColoredContainer(
      color: HexColor("#8425c9"),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SvgPicture.asset(
                  "asset/icons/time-management.svg",
                  height: 18,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Member's Workload",
                  style: AppTextTheme.allTextTheme.labelMedium!.copyWith(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                const RadicalChart(
                  radius: "100%",
                  height: 200,
                  width: 200,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Transform.rotate(
                            angle: 45 * pi / 180,
                            child: Icon(
                              size: 16,
                              Icons.square_rounded,
                              color: HexColor("#F06969"),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text.rich(
                            TextSpan(
                              style: AppTextTheme.allTextTheme.labelLarge!
                                  .copyWith(
                                color: Colors.black,
                              ),
                              children: [
                                const TextSpan(text: '12 '),
                                TextSpan(
                                  text: "Heavy",
                                  style: AppTextTheme.allTextTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Transform.rotate(
                            angle: 45 * pi / 180,
                            child: Icon(
                              size: 16,
                              Icons.square_rounded,
                              color: HexColor("#58AAFB"),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text.rich(
                            TextSpan(
                              style: AppTextTheme.allTextTheme.labelLarge!
                                  .copyWith(
                                color: Colors.black,
                              ),
                              children: [
                                const TextSpan(text: '08 '),
                                TextSpan(
                                  text: "Normal",
                                  style: AppTextTheme.allTextTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Transform.rotate(
                            angle: 45 * pi / 180,
                            child: Icon(
                              size: 16,
                              Icons.square_rounded,
                              color: ConstantColors.primaryGreen,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text.rich(
                            TextSpan(
                              style: AppTextTheme.allTextTheme.labelLarge!
                                  .copyWith(
                                color: Colors.black,
                              ),
                              children: [
                                const TextSpan(text: '02 '),
                                TextSpan(
                                  text: "low",
                                  style: AppTextTheme.allTextTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
