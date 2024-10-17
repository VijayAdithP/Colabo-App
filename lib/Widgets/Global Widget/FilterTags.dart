import 'dart:ui';

import '../../Constants/TextThemes.dart';
import '../../Constants/colors.dart';
import 'BottomSheetWIdget.dart';
import 'ResetAndApply.dart';
import 'SearchBar.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class FilterHeader extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback onClear;
  final bool showClear;
  const FilterHeader(
    this.onClear, {
    super.key,
    required this.title,
    required this.child,
    this.showClear = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: AppTextTheme.allTextTheme.labelSmall,
                  ),
                  if (showClear)
                    GestureDetector(
                      onTap: onClear,
                      child: Text(
                        "Clear",
                        style: AppTextTheme.allTextTheme.labelSmall!.copyWith(
                          color: Colors.red,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}

class FilterTag extends StatefulWidget {
  final String sheettitle;
  final List<String> tagLabels;
  final Function(VoidCallback) onInit;
  const FilterTag({
    super.key,
    required this.tagLabels,
    required this.onInit,
    required this.sheettitle,
  });

  @override
  State<FilterTag> createState() => FilterTagState();
}

class FilterTagState extends State<FilterTag> {
  int? selectedIndex;

  void clearSelection() {
    setState(() {
      selectedIndex = null;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.onInit(clearSelection);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: List.generate(widget.tagLabels.length, (index) {
        bool isSelected = selectedIndex == index;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  List<bool> _isChecked = List<bool>.filled(10, false);
                  return StatefulBuilder(builder: (context, setModalState) {
                    return BottomSheetWidget(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 15,
                              right: 15,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.sheettitle,
                                  style: AppTextTheme.allTextTheme.titleSmall,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: ConstantColors.borderGrey,
                                      ),
                                    ),
                                    child: const Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Icon(
                                          weight: 500,
                                          size: 20,
                                          Icons.close_rounded,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15,
                            ),
                            child: SearchBarWidget(
                              horizontalpadd: 10,
                              verticalpadd: 10,
                              isTappedOn: true,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.3,
                            child: ListView.builder(
                              itemCount: _isChecked.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    if (index != 0)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        child: DottedLine(
                                          dashRadius: 20,
                                          lineThickness: 2,
                                          dashLength: 2,
                                          dashGapLength: 2,
                                          dashColor: ConstantColors.borderGrey,
                                        ),
                                      ),
                                    ListTile(
                                      title: Text('#colabo${index + 1}'),
                                      trailing: Checkbox(
                                        overlayColor: WidgetStateProperty.all(
                                          ConstantColors.borderGrey,
                                        ),
                                        side: BorderSide(
                                          color: ConstantColors.borderGrey,
                                        ),
                                        activeColor:
                                            ConstantColors.primaryGreen,
                                        value: _isChecked[index],
                                        onChanged: (bool? value) {
                                          setModalState(() {
                                            _isChecked[index] = value ?? false;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          Container(
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    color: ConstantColors.borderGrey),
                              ),
                              color: Colors.transparent,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 20,
                              ),
                              child: ResetAndApply(
                                text1: "CANCEL",
                                text2: "SAVE",
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
                });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected
                    ? ConstantColors.primaryGreen
                    : ConstantColors.borderGrey,
              ),
              color: Colors.transparent,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 12,
              ),
              child: Text(
                widget.tagLabels[index],
                style: AppTextTheme.allTextTheme.labelSmall!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
