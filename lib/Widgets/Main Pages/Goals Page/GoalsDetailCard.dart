import 'dart:ui';

import '../../../Constants/TextThemes.dart';
import '../../../Constants/colors.dart';
import '../../Global%20Widget/ProgressIndicator.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class GoalsDetailCard extends StatefulWidget {
  const GoalsDetailCard({super.key});

  @override
  State<GoalsDetailCard> createState() => _GoalsDetailCardState();
}

class _GoalsDetailCardState extends State<GoalsDetailCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(255, 255, 255, 1),
            Color.fromRGBO(230, 230, 255, 0.208),
            Color.fromRGBO(255, 126, 133, 0.08),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0, 0.6, 1],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      style: AppTextTheme.allTextTheme.labelSmall!.copyWith(
                        color: HexColor("#8D8D8D"),
                      ),
                      children: const [
                        TextSpan(text: 'Goal type '),
                        TextSpan(text: "|"),
                        TextSpan(text: " #Colabo"),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 3,
                        ),
                        child: SvgPicture.asset(
                          "asset/icons/medal.svg",
                          height: 18,
                        ),
                      ),
                      const Icon(
                        Icons.info_outline,
                        size: 18,
                        color: Colors.grey,
                      ),
                      const Icon(
                        size: 21,
                        Icons.star_rounded,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: Text(
                "Something Something Something Something Something ",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 3,
                          sigmaY: 3,
                        ),
                        child: ClipRRect(
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
                              color: ConstantColors.scaffoldBackgroundColor,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                    bottom: 10,
                                    right: 16,
                                    left: 16,
                                  ),
                                  child: Text(
                                    "Something Something Something Something Something Something ",
                                    style:
                                        AppTextTheme.allTextTheme.titleMedium,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 16,
                                  ),
                                  child: Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                    style: AppTextTheme.allTextTheme.labelSmall,
                                  ),
                                ),
                                DottedLine(
                                  dashRadius: 20,
                                  lineThickness: 2,
                                  dashLength: 2,
                                  dashGapLength: 2,
                                  dashColor: ConstantColors.borderGrey,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.1,
                                  width: MediaQuery.sizeOf(context).width,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: ConstantColors.borderGrey,
                                            ),
                                          ),
                                          child: Center(
                                              child: Text(
                                            "Close",
                                            style: AppTextTheme
                                                .allTextTheme.titleSmall!
                                                .copyWith(
                                              fontSize: 17,
                                            ),
                                          )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: Text(
                'Show description',
                style: AppTextTheme.allTextTheme.labelSmall!.copyWith(
                  color: ConstantColors.primaryGreen,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 25,
              ),
              child: Text.rich(
                TextSpan(
                  style: AppTextTheme.allTextTheme.labelSmall!.copyWith(
                    color: Colors.grey[600],
                  ),
                  children: const [
                    TextSpan(text: 'Dec 21,2023'),
                    TextSpan(text: " - "),
                    TextSpan(text: "Dec 28,2023"),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Progressindicator(
                  backAndTextColor: ConstantColors.primaryBlandGreen,
                  indicatorRadius: 20,
                  progressColor: ConstantColors.primaryGreen,
                  progressLineWidth: 4,
                  progressCent: 40,
                  text: "on Track",
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    border: Border.all(
                      color: ConstantColors.borderGrey,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "View Metrics",
                          style: AppTextTheme.allTextTheme.labelSmall!.copyWith(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          color: Colors.black,
                          size: 12,
                          Icons.arrow_forward_ios_rounded,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
