import '../../Constants/FlutterIcons.dart';
import '../../Constants/TextThemes.dart';
import '../../Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class SearchBarWidget extends StatelessWidget {
  final double verticalpadd;
  final double horizontalpadd;
  final bool isTappedOn;
  const SearchBarWidget(
      {super.key,
      required this.isTappedOn,
      required this.verticalpadd,
      required this.horizontalpadd});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: isTappedOn
              ? ConstantColors.secondaryScaffoldBackgroundColor
              : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: ConstantColors.borderGrey,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: verticalpadd,
            horizontal: horizontalpadd,
          ),
          child: Row(
            children: [
              const Icon(
                Icons.search,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Search",
                style: AppTextTheme.allTextTheme.bodyLarge,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FilterWidget extends StatelessWidget {
  final bool istappedOn;
  final double verticalpadd;
  final double horizontalpadd;
  final double iconSize;
  final Function function;
  const FilterWidget({
    super.key,
    required this.istappedOn,
    required this.verticalpadd,
    required this.horizontalpadd,
    required this.iconSize,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: istappedOn
                ? ConstantColors.borderGrey2
                : ConstantColors.primaryLightGreen,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: verticalpadd,
            horizontal: horizontalpadd,
          ),
          child: badges.Badge(
            badgeStyle: badges.BadgeStyle(
              shape: badges.BadgeShape.circle,
              borderSide: istappedOn
                  ? BorderSide.none
                  : const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
              badgeColor: istappedOn
                  ? Colors.transparent
                  : ConstantColors.primaryLightGreen,
              elevation: 0,
            ),
            position: badges.BadgePosition.topEnd(
              top: 0,
              end: 0,
            ),
            onTap: () {},
            child: FittedBox(
              child: Icon(
                MyFlutterApp.filter_black,
                size: iconSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
