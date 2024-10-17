import '../../../Constants/TextThemes.dart';
import '../../../Constants/colors.dart';
import 'package:flutter/material.dart';

class WorkSpaceCard extends StatefulWidget {
  final int workspaceCount;
  final String workspaceImg;
  final double cardHeight;
  final double cardWidth;
  const WorkSpaceCard({
    super.key,
    required this.workspaceCount,
    required this.workspaceImg,
    required this.cardHeight,
    required this.cardWidth,
  });

  @override
  State<WorkSpaceCard> createState() => _WorkSpaceCardState();
}

class _WorkSpaceCardState extends State<WorkSpaceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.cardHeight,
      width: widget.cardWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: ConstantColors.borderGrey,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Workspace ${widget.workspaceCount}",
              style: AppTextTheme.allTextTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Image.network(
                height: 70,
                widget.workspaceImg,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
