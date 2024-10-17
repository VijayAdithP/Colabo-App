import 'package:colabomobileapp/Constants/TextThemes.dart';
import 'package:colabomobileapp/Constants/colors.dart';
import 'package:colabomobileapp/Pages/WorkSpace%20Screen/WorkSpaceScreen.dart';
import 'package:colabomobileapp/Services/Providers/BasicProviders.dart';
import 'package:colabomobileapp/Widgets/Global%20Widget/GeneralCard.dart';
import 'package:colabomobileapp/Widgets/Main%20Pages/Home%20Page/StarAvatar.dart';
import 'package:colabomobileapp/Widgets/Main%20Pages/Home%20Page/WelcomeProfile.dart';
import 'package:colabomobileapp/Widgets/Main%20Pages/Home%20Page/WorkspaceSwitchCard.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final workspaceData = ref.watch(workspaceProvider);

    return Container(
      color: ConstantColors.secondaryScaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          backgroundColor: ConstantColors.secondaryScaffoldBackgroundColor,
          body: Padding(
            padding: const EdgeInsets.only(
              right: 16,
              left: 16,
              top: 16,
            ),
            child: Column(children: [
              // The Welcome Text with Profile Image...
              const WelcomeProfile(
                userName: "Vijay",
                userProfileImg: "asset/images/profile_image.png",
              ),
              const SizedBox(
                height: 10,
              ),
              // General Card is used Globally (has some elevation)
              GeneralCard(
                // Card used to switch the workspace
                child: WorkSpaceSwitchCard(
                  workspaceNum: workspaceData!.index,
                  workspaceImg: workspaceData.imagePath,
                  function: () {
                    // Back to WorkSpace selection
                    Get.offAll(() => const WorkSpaceScreen());
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: DottedLine(
                  lineThickness: 1,
                  dashLength: 2,
                  dashColor: ConstantColors.borderGrey.withOpacity(1),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: StarAvatar(),
              ),
              // All the place holder widgets
              Expanded(
                child: FadingEdgeScrollView.fromScrollView(
                  gradientFractionOnStart: 0.0,
                  gradientFractionOnEnd: 1.0,
                  child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 100),
                      controller: _controller,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10,
                          ),
                          child: GeneralCard(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 100,
                              ),
                              child: Center(
                                child: Text(
                                  "Widget $index",
                                  style: AppTextTheme.allTextTheme.labelMedium,
                                ),
                              ),
                            ),
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
