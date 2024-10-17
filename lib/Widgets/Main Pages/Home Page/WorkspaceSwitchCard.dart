import '../../../Constants/ConstantText.dart';
import '../../../Constants/TextThemes.dart';
import '../../../Constants/colors.dart';
import 'package:flutter/material.dart';

class WorkSpaceSwitchCard extends StatefulWidget {
  final int workspaceNum;
  final String workspaceImg;
  final Function function;
  const WorkSpaceSwitchCard(
      {super.key,
      required this.workspaceNum,
      required this.function,
      required this.workspaceImg});

  @override
  State<WorkSpaceSwitchCard> createState() => _WorkSpaceSwitchCardState();
}

class _WorkSpaceSwitchCardState extends State<WorkSpaceSwitchCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ConstantText.HomeWorkSpace,
            style: AppTextTheme.allTextTheme.labelSmall!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ConstantColors.scaffoldBackgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    height: 40,
                    widget.workspaceImg,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Workspace ${widget.workspaceNum}",
                style: AppTextTheme.allTextTheme.titleSmall,
              ),
              const Expanded(
                child: SizedBox(),
              ),
              GestureDetector(
                onTap: () {
                  widget.function();
                },
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: ConstantColors.borderGrey,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.refresh_rounded,
                            size: 20,
                            color: Colors.black,
                          ),
                          Text(
                            ConstantText.HomeSwitch,
                            style:
                                AppTextTheme.allTextTheme.bodyMedium!.copyWith(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
