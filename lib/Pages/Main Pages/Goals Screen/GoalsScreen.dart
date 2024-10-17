import 'dart:ui';

import '../../../Constants/ConstantText.dart';
import '../../../Constants/TextThemes.dart';
import '../../../Constants/colors.dart';
import '../../../Services/Providers/BasicProviders.dart';
import '../../../Widgets/Global%20Widget/BottomSheetWIdget.dart';
import '../../../Widgets/Global%20Widget/EmptyPlaceholder.dart';
import '../../../Widgets/Global%20Widget/HashTagFilter.dart';
import '../../../Widgets/Global%20Widget/Headers.dart';
import '../../../Widgets/Global%20Widget/ResetAndApply.dart';
import '../../../Widgets/Global%20Widget/SearchBar.dart';
import '../../../Widgets/Global%20Widget/FilterTags.dart';
import '../../../Widgets/Main%20Pages/Goals%20Page/ListItems.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoalsScreen extends ConsumerStatefulWidget {
  const GoalsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends ConsumerState<GoalsScreen> {
  final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTappedOn = ref.watch(goalsStateProvider);
    VoidCallback? clearDueSelection;
    VoidCallback? clearAsigneeSelection;
    VoidCallback? clearStatueSelection;
    VoidCallback? clearStatusAgainSelection;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            right: 16,
            left: 16,
          ),
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                      bottom: 10,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // to toggle the page to an empty one, also to save the state of that toggle...
                        setState(() {
                          ref.read(goalsStateProvider.notifier).toggle();
                        });
                      },
                      child: Headers(
                        headerCount: isTappedOn ? 00 : 10,
                        headerText: "Goals",
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        // common searchbar
                        child: SearchBarWidget(
                          horizontalpadd: 10,
                          verticalpadd: 12,
                          isTappedOn: isTappedOn,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),

                      // common filter widget
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
                              // Commonly used botton sheet (Global comp)
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
                                                  if (clearDueSelection !=
                                                      null) {
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
                                                  sheettitle:
                                                      "Filter by status",
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
                                                  sheettitle:
                                                      "Filter by status",
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
                                          MediaQuery.sizeOf(context).height *
                                              0.1,
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
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              isTappedOn
                  ? Expanded(
                      child: Center(
                          // Create new Goal page (togglable)
                          child: Emptyplaceholder(
                        createText: ConstantText.GoalCreateGoal,
                        text: ConstantText.GoalCreateTextGoal,
                      )),
                    )

                  // the actual Goal Page UI
                  : Expanded(
                      child: FadingEdgeScrollView.fromScrollView(
                        gradientFractionOnStart: 0.0,
                        gradientFractionOnEnd: 0.8,
                        child: ListView.builder(
                          controller: _controller,
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 100,
                          ),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                if (index != 0)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    child: DottedLine(
                                      dashRadius: 20,
                                      lineThickness: 2,
                                      dashLength: 2,
                                      dashGapLength: 2,
                                      dashColor: ConstantColors.borderGrey,
                                    ),
                                  ),

                                // Common List for the Goals page
                                CustomListItem(
                                  textOnlyContinerHeight:
                                      (index == 2 || index == 4) ? 10 : 0,
                                  showIndicator:
                                      (index == 2 || index == 4) ? false : true,
                                  backAndTextColor: (index == 2 || index == 4)
                                      ? Colors.red
                                      : index == 1
                                          ? ConstantColors.commonTextColor
                                          : ConstantColors.primaryBlandGreen,
                                  indicatorRadius: 20,
                                  isStarred: true,
                                  mainText: ConstantText.commontext,
                                  progressColor: (index == 1 || index == 4)
                                      ? ConstantColors.commonTextColor
                                      : ConstantColors.primaryGreen,
                                  progressLineWidth: 4,
                                  progressPercent: 40,
                                  progressText: (index == 2 || index == 4)
                                      ? "Project setup incomplete"
                                      : index == 1
                                          ? "Closing on Dec 29,2024"
                                          : "on Track",
                                ),
                                if (index == 10)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    child: DottedLine(
                                      dashRadius: 20,
                                      lineThickness: 2,
                                      dashLength: 2,
                                      dashGapLength: 2,
                                      dashColor: ConstantColors.borderGrey,
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
