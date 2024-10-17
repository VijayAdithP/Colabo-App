import 'package:colabomobileapp/Constants/TextThemes.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class StarAvatar extends StatelessWidget {
  const StarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          decoration: BoxDecoration(
            color: HexColor("#E52030"),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Icon(
              color: HexColor("#FFB700"),
              Icons.star,
              size: 20,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            "List of items on your plate today!",
            style: AppTextTheme.allTextTheme.titleMedium!.copyWith(
              fontSize: 18,
            ),
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
