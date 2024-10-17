import 'package:colabomobileapp/Constants/FlutterIcons.dart';
import 'package:colabomobileapp/Constants/TextThemes.dart';
import 'package:colabomobileapp/Constants/colors.dart';
import 'package:colabomobileapp/Pages/Main%20Pages/ActionScreen.dart';
import 'package:colabomobileapp/Pages/Main%20Pages/Goals%20Screen/GoalsScreen.dart';
import 'package:colabomobileapp/Pages/Main%20Pages/HomeScreen.dart';
import 'package:colabomobileapp/Pages/Main%20Pages/PlaceHolder.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainPages extends StatefulWidget {
  const MainPages({super.key});

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  int _selectedIndex = 0;

// All the main screens(pages)
  List screens = [
    const HomeScreen(),
    const GoalsScreen(),
    const ActionScreen(),
    const PlaceHolder(),
    const PlaceHolder(),
  ];
  List backgroundColor = [
    ConstantColors.secondaryScaffoldBackgroundColor,
    ConstantColors.scaffoldBackgroundColor,
    ConstantColors.scaffoldBackgroundColor,
    ConstantColors.scaffoldBackgroundColor,
    ConstantColors.scaffoldBackgroundColor,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: screens[_selectedIndex],
          ),

          // Bottom navigation bar
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: ConstantColors.primaryDarkGreen,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 16,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: GNav(
                    backgroundColor: ConstantColors.primaryDarkGreen,
                    tabBackgroundColor: ConstantColors.primaryGreen,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    gap: 6,
                    onTabChange: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    tabs: [
                      GButton(
                        textStyle:
                            AppTextTheme.allTextTheme.labelLarge!.copyWith(
                          color: ConstantColors.commonWhiteColor,
                          fontSize: 15,
                        ),
                        text: "Homes",
                        icon: MyFlutterApp.home_black,
                        iconActiveColor: ConstantColors.commonWhiteColor,
                        textColor: ConstantColors.commonWhiteColor,
                        iconColor: ConstantColors.commonWhiteColor,
                      ),
                      GButton(
                        textStyle:
                            AppTextTheme.allTextTheme.labelLarge!.copyWith(
                          color: ConstantColors.commonWhiteColor,
                          fontSize: 15,
                        ),
                        text: "Goals",
                        icon: MyFlutterApp.target_icon,
                        iconActiveColor: ConstantColors.commonWhiteColor,
                        textColor: ConstantColors.commonWhiteColor,
                        iconColor: ConstantColors.commonWhiteColor,
                      ),
                      GButton(
                        textStyle:
                            AppTextTheme.allTextTheme.labelLarge!.copyWith(
                          color: ConstantColors.commonWhiteColor,
                          fontSize: 15,
                        ),
                        text: "Actions",
                        icon: MyFlutterApp.gas_black,
                        iconActiveColor: ConstantColors.commonWhiteColor,
                        textColor: ConstantColors.commonWhiteColor,
                        iconColor: ConstantColors.commonWhiteColor,
                      ),
                      GButton(
                        textStyle:
                            AppTextTheme.allTextTheme.labelLarge!.copyWith(
                          color: ConstantColors.commonWhiteColor,
                          fontSize: 15,
                        ),
                        text: "Chat",
                        icon: MyFlutterApp.chat_black,
                        iconActiveColor: ConstantColors.commonWhiteColor,
                        textColor: ConstantColors.commonWhiteColor,
                        iconColor: ConstantColors.commonWhiteColor,
                      ),
                      GButton(
                        textStyle:
                            AppTextTheme.allTextTheme.labelLarge!.copyWith(
                          color: ConstantColors.commonWhiteColor,
                          fontSize: 15,
                        ),
                        text: "Notifications",
                        icon: MyFlutterApp.notif_black,
                        iconActiveColor: ConstantColors.commonWhiteColor,
                        textColor: ConstantColors.commonWhiteColor,
                        iconColor: ConstantColors.commonWhiteColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
