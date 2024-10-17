import '../../../Constants/ConstantText.dart';
import '../../../Constants/FlutterIcons.dart';
import '../../../Constants/TextThemes.dart';
import '../../../Constants/colors.dart';
import '../../Global Widget/GeneralCard.dart';
import '../../Global Widget/ProgressIndicator.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class ActionCards extends StatefulWidget {
  final bool isOverdue;
  final Color bookmarkColor;
  final bool isStared;
  final bool isACT;
  const ActionCards(
      {super.key,
      required this.isOverdue,
      required this.bookmarkColor,
      required this.isStared,
      required this.isACT});

  @override
  State<ActionCards> createState() => _ActionCardsState();
}

class _ActionCardsState extends State<ActionCards> {
  @override
  Widget build(BuildContext context) {
    return GeneralCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(bottom: 16, right: 16, left: 16, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ConstantText.ActionBug,
                  style: AppTextTheme.allTextTheme.labelSmall!.copyWith(
                    color: HexColor("#8D8D8D"),
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
                      widget.isStared
                          ? Icons.star_rounded
                          : Icons.star_outline_rounded,
                      color: Colors.amber,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 16, left: 16),
            child: Text(
              ConstantText.commontext,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 5,
                  ),
                  child: SvgPicture.asset(
                    "asset/icons/flag-gold.svg",
                    height: 15,
                    colorFilter: const ColorFilter.mode(
                      Colors.red,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Text.rich(
                  TextSpan(
                    style: AppTextTheme.allTextTheme.labelSmall!.copyWith(
                      color: ConstantColors.commonTextColor,
                    ),
                    children: [
                      const TextSpan(text: 'Jun 29,2021'),
                      const TextSpan(text: " • "),
                      const TextSpan(text: "8:00 PM"),
                      if (widget.isOverdue) const TextSpan(text: " | "),
                      if (widget.isOverdue)
                        TextSpan(
                          text: "Overdue",
                          style: AppTextTheme.allTextTheme.labelSmall!.copyWith(
                            color: Colors.red,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 16, left: 16, top: 20, bottom: 16),
            child: Row(children: [
              Progressindicator(
                backAndTextColor: ConstantColors.primaryGreen,
                indicatorRadius: 20,
                progressCent: 35,
                progressColor: ConstantColors.primaryGreen,
                progressLineWidth: 3,
                text: "",
                showText: false,
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: ConstantColors.borderGrey,
                  ),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 5, top: 5, left: 5, right: 5),
                        child: Icon(
                          size: 20,
                          MyFlutterApp.user_black,
                          color: ConstantColors.borderGrey,
                        ),
                      ),
                      const Text("4"),
                      VerticalDivider(
                        color: ConstantColors.borderGrey,
                      ),
                      Icon(
                        size: 20,
                        MyFlutterApp.task_grey,
                        color: ConstantColors.borderGrey,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            bottom: 5, top: 5, right: 10, left: 5),
                        child: Text("2"),
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              Container(
                  decoration: BoxDecoration(
                      color: widget.bookmarkColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Icon(
                        MyFlutterApp.bookmark_blue,
                        color: widget.bookmarkColor,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Colabo",
                        style: AppTextTheme.allTextTheme.labelSmall!.copyWith(
                          color: widget.bookmarkColor,
                        ),
                      )
                    ]),
                  ))
            ]),
          ),
          DottedLine(
            dashRadius: 20,
            lineThickness: 2,
            dashLength: 2,
            dashGapLength: 2,
            dashColor: ConstantColors.borderGrey,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
            child: Row(
              children: [
                Flexible(
                  child: Text.rich(
                    TextSpan(
                      style: AppTextTheme.allTextTheme.labelSmall!.copyWith(
                        color: ConstantColors.commonTextColor,
                      ),
                      children: [
                        TextSpan(text: ConstantText.ActionEst),
                        if (widget.isACT) const TextSpan(text: " | "),
                        if (widget.isACT)
                          TextSpan(text: ConstantText.ActionAct),
                      ],
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    border: Border.all(
                      color: ConstantColors.borderGrey,
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    child: Row(
                      children: [
                        Text(
                          "Pending",
                          style: AppTextTheme.allTextTheme.labelSmall!.copyWith(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        const Icon(
                          color: Colors.black,
                          Icons.arrow_drop_down,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
