import 'dart:ui';

import 'package:colabomobileapp/Constants/TextThemes.dart';
import 'package:colabomobileapp/Constants/colors.dart';
import 'package:colabomobileapp/Widgets/Global%20Widget/CreateCards.dart';
import 'package:colabomobileapp/Widgets/Global%20Widget/HashTagFilter.dart';
import 'package:colabomobileapp/Widgets/Global%20Widget/ResetAndApply.dart';
import 'package:colabomobileapp/Widgets/Global%20Widget/FilterTags.dart';
import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController actionTitleController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: ConstantColors.primaryGreen.withOpacity(0.5),
              blurRadius: 20,
              spreadRadius: 0,
              offset: const Offset(0.5, 0.5),
              blurStyle: BlurStyle.solid,
            )
          ]),
      height: 60,
      width: 60,
      child: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: ConstantColors.primaryGreen,
        elevation: 00,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 3,
                  sigmaY: 3,
                ),
                child: Wrap(
                  children: [
                    ClipRRect(
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
                                top: 16,
                                left: 16,
                                right: 16,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Create Action",
                                    style:
                                        AppTextTheme.allTextTheme.titleMedium,
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
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 16,
                                right: 16,
                              ),
                              child: SizedBox(
                                height: MediaQuery.sizeOf(context).height * 0.6,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Createcards(
                                          controller: actionTitleController,
                                          function: (value) {},
                                          label: "Enter Action Title",
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: FilterHeader(
                                          showClear: false,
                                          title: "Choose Action Type",
                                          child: FilterHashtag(
                                            height: 50,
                                            suffixIcon: const Icon(
                                              size: 35,
                                              Icons.arrow_drop_down,
                                              color: Colors.black,
                                            ),
                                            suggestions: const [
                                              "ProDkt",
                                              "Open",
                                              "Closed",
                                            ],
                                          ),
                                          () {},
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: FilterHeader(
                                          showClear: false,
                                          title:
                                              "Choose Hashtag or Create New ",
                                          child: FilterHashtag(
                                            height: 50,
                                            prefixIcon: Icon(
                                              Icons.tag,
                                              color: ConstantColors.borderGrey,
                                            ),
                                            suffixIcon: const Icon(
                                              size: 35,
                                              Icons.arrow_drop_down,
                                              color: Colors.black,
                                            ),
                                            suggestions: const [
                                              "ProDkt",
                                              "Open",
                                              "Closed",
                                            ],
                                          ),
                                          () {},
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Createcards(
                                          suffixIcon: const Icon(
                                            Icons.calendar_month_outlined,
                                            color: Colors.black,
                                          ),
                                          height: 15,
                                          controller: dateController,
                                          function: (value) {},
                                          label: "Add Due Date",
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: FilterHeader(
                                          showClear: false,
                                          title: "Attach Goal",
                                          child: FilterHashtag(
                                            height: 50,
                                            prefixIcon: const Icon(
                                              Icons.search,
                                              color: Colors.black,
                                            ),
                                            suffixIcon: const Icon(
                                              size: 35,
                                              Icons.arrow_drop_down,
                                              color: Colors.black,
                                            ),
                                            suggestions: const [
                                              "Goal",
                                              "Idk",
                                              "Something",
                                            ],
                                          ),
                                          () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // Bottom section (can be buttons or other components)
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
                                  text2: "CREATE ACTION",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
