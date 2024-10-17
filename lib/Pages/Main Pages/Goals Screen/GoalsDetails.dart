import '../../../Constants/TextThemes.dart';
import '../../../Constants/colors.dart';
import '../../../Widgets/Global%20Widget/GeneralCard.dart';
import '../../../Widgets/Global%20Widget/SearchBar.dart';
import '../../../Widgets/Main%20Pages/Goals%20Page/CompletedActionsWIdget.dart';
import '../../../Widgets/Main%20Pages/Goals%20Page/GoalHiearchyList.dart';
import '../../../Widgets/Main%20Pages/Goals%20Page/GoalsChart.dart';
import '../../../Widgets/Main%20Pages/Goals%20Page/GoalsDetailCard.dart';
import 'package:flutter/material.dart';

class GoalsDetails extends StatefulWidget {
  const GoalsDetails({super.key});

  @override
  State<GoalsDetails> createState() => _GoalsDetailsState();
}

class _GoalsDetailsState extends State<GoalsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ConstantColors.primaryGreen,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Center(
                child: Icon(
                  size: 18,
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                right: 16,
                left: 16,
                top: 10,
              ),
              child: GeneralCard(
                showShadow: false,

                // the card with the gradient is this...
                child: GoalsDetailCard(),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 20, right: 15, left: 15, bottom: 15),

              // the card with the fire icon is this..
              child: CompletedActionsWidget(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),

              // this is the radical chart...
              child: GoalsChart(),
            ),

            // this is the Goals Hiearchy widget...
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: ConstantColors.borderGrey3,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Goals Hiearchy",
                              style: AppTextTheme.allTextTheme.titleSmall!
                                  .copyWith(
                                color: ConstantColors.commonTextColor,
                              )),
                        ],
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: SearchBarWidget(
                        horizontalpadd: 14,
                        verticalpadd: 13,
                        isTappedOn: false,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.7,
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.only(
                                  right: 16,
                                  left: 16,
                                ),

                                // all the listtiles...
                                child: GoalHiearchyList(
                                  index: index,
                                ));
                          }),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
