import 'package:colabomobileapp/Constants/TextThemes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Progressindicator extends StatelessWidget {
  final double indicatorRadius;
  final String text;
  final double progressCent;
  final Color progressColor;
  final Color backAndTextColor;
  final double progressLineWidth;
  final bool showIndicator;
  final bool showText;
  final double textOnlyContinerHeight;
  const Progressindicator(
      {super.key,
      required this.indicatorRadius,
      required this.text,
      required this.progressCent,
      required this.progressColor,
      required this.backAndTextColor,
      required this.progressLineWidth,
      this.showIndicator = true,
      this.showText = true,
      this.textOnlyContinerHeight = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backAndTextColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showIndicator)
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CircularPercentIndicator(
                fillColor: Colors.white,
                radius: indicatorRadius,
                lineWidth: progressLineWidth,
                percent: progressCent / 100,
                center: Padding(
                  padding: const EdgeInsets.all(7),
                  child: FittedBox(
                    child: Text(
                      "${progressCent.toStringAsFixed(0)}%",
                      style: AppTextTheme.allTextTheme.titleSmall!.copyWith(),
                    ),
                  ),
                ),
                progressColor: progressColor,
              ),
            ),
          if (showText)
            Padding(
              padding: EdgeInsets.only(
                left: showIndicator ? 5 : 10,
                right: 10,
                top: textOnlyContinerHeight,
                bottom: textOnlyContinerHeight,
              ),
              child: FittedBox(
                child: Text(
                  text,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle().copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: backAndTextColor,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
