import 'dart:ui';

import 'package:colabomobileapp/Constants/ConstantText.dart';
import 'package:colabomobileapp/Constants/TextThemes.dart';
import 'package:colabomobileapp/Constants/colors.dart';
import 'package:colabomobileapp/Services/Providers/BasicProviders.dart';
import 'package:colabomobileapp/Widgets/Global%20Widget/BottomSheetWIdget.dart';
import 'package:colabomobileapp/Widgets/Global%20Widget/EmptyPlaceholder.dart';
import 'package:colabomobileapp/Widgets/Global%20Widget/FloatingButton.dart';
import 'package:colabomobileapp/Widgets/Global%20Widget/HashTagFilter.dart';
import 'package:colabomobileapp/Widgets/Global%20Widget/Headers.dart';
import 'package:colabomobileapp/Widgets/Global%20Widget/ResetAndApply.dart';
import 'package:colabomobileapp/Widgets/Global%20Widget/SearchBar.dart';
import 'package:colabomobileapp/Widgets/Main%20Pages/Action%20Page/ActionCards.dart';
import 'package:colabomobileapp/Widgets/Global%20Widget/FilterTags.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActionScreen extends ConsumerStatefulWidget {
  const ActionScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ActionScreenState();
}

class _ActionScreenState extends ConsumerState<ActionScreen> {
  final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTappedOn = ref.watch(actionStateProvider);
    VoidCallback? clearDueSelection;
    VoidCallback? clearAsigneeSelection;
    VoidCallback? clearStatueSelection;
    VoidCallback? clearStatusAgainSelection;
    return Container(
      color: isTappedOn
          ? ConstantColors.scaffoldBackgroundColor
          : ConstantColors.secondaryScaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: isTappedOn
              ? ConstantColors.scaffoldBackgroundColor
              : ConstantColors.secondaryScaffoldBackgroundColor,
          floatingActionButton: const Align(
            alignment: Alignment(1, 0.75),

            // Button to add a new Action...
            child: FloatingButton(),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              right: 16,
              left: 16,
            ),
            child: Column(children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                      bottom: 10,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          ref.read(actionStateProvider.notifier).toggle();
                        });
                      },
                      child: Headers(
                        headerCount: isTappedOn ? 00 : 10,
                        headerText: "Actions",
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        // Commonly used SearchBar widget...
                        child: SearchBarWidget(
                          horizontalpadd: 10,
                          verticalpadd: 12,
                          isTappedOn: isTappedOn,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),

                      // Commenly used filter widget...
                      FilterWidget(
                        horizontalpadd: 10,
                        istappedOn: isTappedOn,
                        verticalpadd: 10,
                        iconSize: 30,
                        function: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Filters",
                                          style: AppTextTheme
                                              .allTextTheme.titleSmall,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    ConstantColors.borderGrey,
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
                                      left: 15,
                                      right: 15,
                                    ),
                                    child: SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.5,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            FilterHeader(
                                              title: "Filter by due date",
                                              child: FilterTag(
                                                sheettitle:
                                                    "Filter by due date",
                                                tagLabels: const [
                                                  "All",
                                                  "Today",
                                                  "This week",
                                                  "This month",
                                                  "Overdue",
                                                ],
                                                onInit:
                                                    (clearSelectionCallback) {
                                                  clearDueSelection =
                                                      clearSelectionCallback;
                                                },
                                              ),
                                              () {
                                                if (clearDueSelection != null) {
                                                  clearDueSelection!();
                                                }
                                              },
                                            ),

                                            // Filter by assignee
                                            FilterHeader(
                                              title: "Filter by assignee",
                                              child: FilterTag(
                                                sheettitle:
                                                    "Filter by assignee",
                                                tagLabels: const [
                                                  "All",
                                                  "From me",
                                                  "To me",
                                                  "Following",
                                                ],
                                                onInit:
                                                    (clearSelectionCallback) {
                                                  clearAsigneeSelection =
                                                      clearSelectionCallback;
                                                },
                                              ),
                                              () {
                                                if (clearAsigneeSelection !=
                                                    null) {
                                                  clearAsigneeSelection!();
                                                }
                                              },
                                            ),

                                            // Filter by status
                                            FilterHeader(
                                              title: "Filter by status",
                                              child: FilterTag(
                                                sheettitle: "Filter by status",
                                                tagLabels: const [
                                                  "All",
                                                  "Open",
                                                  "Closed",
                                                ],
                                                onInit:
                                                    (clearSelectionCallback) {
                                                  clearStatueSelection =
                                                      clearSelectionCallback;
                                                },
                                              ),
                                              () {
                                                if (clearStatueSelection !=
                                                    null) {
                                                  clearStatueSelection!();
                                                }
                                              },
                                            ),

                                            // Filter by hashtag
                                            FilterHeader(
                                              title: "Filter by hashtag",
                                              child: FilterHashtag(
                                                prefixIcon:
                                                    const Icon(Icons.search),
                                                suffixIcon: const Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.black,
                                                ),
                                                suggestions: const [
                                                  "All",
                                                  "Open",
                                                  "Closed",
                                                ],
                                              ),
                                              () {},
                                            ),

                                            // Filter by another status
                                            FilterHeader(
                                              title: "Filter by status",
                                              child: FilterTag(
                                                sheettitle: "Filter by status",
                                                tagLabels: const [
                                                  "Project",
                                                  "Product",
                                                  "OKR",
                                                ],
                                                onInit:
                                                    (clearSelectionCallback) {
                                                  clearStatusAgainSelection =
                                                      clearSelectionCallback;
                                                },
                                              ),
                                              () {
                                                if (clearStatusAgainSelection !=
                                                    null) {
                                                  clearStatusAgainSelection!();
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Bottom section (can be buttons or other components)
                                  Container(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
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
                                        text1: "RESET",
                                        text2: "APPLY",
                                      ),
                                    ),
                                  ),
                                ],
                              ));
                            },
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
              isTappedOn
                  ? Expanded(
                      child: Center(
                          child: Emptyplaceholder(
                        createText: ConstantText.ActionCreateAction,
                        text: ConstantText.ActionCreateActionText,
                      )),
                    )
                  : Expanded(
                      child: FadingEdgeScrollView.fromScrollView(
                        gradientFractionOnStart: 0.0,
                        gradientFractionOnEnd: 0.8,
                        child: ListView.builder(
                            controller: _controller,
                            padding: const EdgeInsets.only(
                              top: 20,
                              bottom: 100,
                            ),
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: ActionCards(
                                  isACT:
                                      (index == 0 || index == 3) ? true : false,
                                  bookmarkColor: (index == 0 || index == 3)
                                      ? Colors.red
                                      : Colors.blue,
                                  isOverdue:
                                      (index == 0 || index == 4) ? true : false,
                                  isStared:
                                      (index == 0 || index == 2) ? true : false,
                                ),
                              );
                            }),
                      ),
                    ),      
            ]),
          ),
        ),
      ),
    );
  }
}
