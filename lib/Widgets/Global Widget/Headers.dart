import '../../Constants/TextThemes.dart';
import 'package:flutter/material.dart';

class Headers extends StatefulWidget {
  final String headerText;
  final int headerCount;
  const Headers({
    super.key,
    required this.headerText,
    required this.headerCount,
  });

  @override
  State<Headers> createState() => _HeadersState();
}

class _HeadersState extends State<Headers> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.headerText,
          style: AppTextTheme.allTextTheme.titleLarge,
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 25,
          width: 25,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: FittedBox(
              child: Text(
                widget.headerCount.toString(),
                style: AppTextTheme.allTextTheme.labelSmall!.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
