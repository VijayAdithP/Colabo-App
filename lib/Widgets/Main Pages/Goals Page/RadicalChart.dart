import 'package:colabomobileapp/Constants/TextThemes.dart';
import 'package:colabomobileapp/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadicalChart extends StatefulWidget {
  final double height;
  final double width;
  final String radius;
  const RadicalChart(
      {super.key,
      required this.height,
      required this.width,
      required this.radius});

  @override
  State<RadicalChart> createState() => _RadicalChartState();
}

class _RadicalChartState extends State<RadicalChart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: SfCircularChart(
        series: <CircularSeries>[
          RadialBarSeries<GDPData, String>(
            dataSource: [
              GDPData(
                'Oceania',
                12,
                HexColor("#F06969"),
              ),
              GDPData(
                'Africa',
                8,
                HexColor("#58AAFB"),
              ),
              GDPData(
                'S America',
                2,
                ConstantColors.primaryGreen,
              ),
            ],
            trackColor: Colors.white,
            trackOpacity: 1.0,
            xValueMapper: (GDPData data, _) => data.continent,
            yValueMapper: (GDPData data, _) => data.gdp,
            pointColorMapper: (GDPData data, _) => data.colors,
            maximumValue: 24,
            gap: '17%',
            radius: widget.radius,
            cornerStyle: CornerStyle.bothCurve,
          )
        ],
        annotations: [
          CircularChartAnnotation(
              widget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "24",
                style: AppTextTheme.allTextTheme.bodySmall,
              ),
              Text(
                "Members",
                style: AppTextTheme.allTextTheme.labelSmall!.copyWith(
                  fontSize: 13,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class GDPData {
  GDPData(this.continent, this.gdp, this.colors);
  final String continent;
  final int gdp;
  final Color colors;
}
