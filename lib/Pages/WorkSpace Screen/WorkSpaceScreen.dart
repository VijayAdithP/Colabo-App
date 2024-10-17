import 'package:colabomobileapp/Constants/colors.dart';
import 'package:colabomobileapp/Pages/Main%20Pages/BottomNavBar.dart';
import 'package:colabomobileapp/Services/Providers/BasicProviders.dart';
import 'package:colabomobileapp/Widgets/Global%20Widget/Headers.dart';
import 'package:colabomobileapp/Widgets/Workspace%20Screen/WorkspaceCards.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class WorkSpaceScreen extends ConsumerStatefulWidget {
  const WorkSpaceScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WorSspacSscreenState();
}

class _WorSspacSscreenState extends ConsumerState<WorkSpaceScreen> {
  final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List Images = [
    'https://www.uilogos.co/logos/mark/nirastate.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8UugzXMI53oG4JzXwyt7_OG2_96PQqSjmHubANv_211HCPkw8',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlf80RhWutch2VXwitBFdXR-VP4WsDO8TIPNQlTpsalxHJmUlC',
    'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcR1V75ia1x5eHXPPhhtIkxwb-oAyBRHjMM_lse73NQ7GkaviXkk',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ17JKxNufHoAZxTf4t7V6MasYBmhvPmIJHmzJl50PzOgM7brn_',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlP-Dzw-SzcyibvpoRH_Rk3NvaZCdz0iPtDtus5sC0BZdC0AVT',
    'https://th.bing.com/th/id/OIP.uCWWapyB0YZi7nfw5aDxFQHaHa?pid=ImgDet&w=152&h=152&c=7',
    'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQkKKYIookFSpa-WyUwJOrcQre5FuVLDjvhSmK1MfY3jZCp71H7',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ConstantColors.scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ConstantColors.scaffoldBackgroundColor,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),

                // Common header for all pages
                child: Headers(
                  headerCount: Images.length,
                  headerText: "Workspace",
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: FadingEdgeScrollView.fromScrollView(
                    gradientFractionOnStart: 0.0,
                    gradientFractionOnEnd: 0.3,
                    child: GridView.builder(
                        padding: const EdgeInsets.only(bottom: 20),
                        controller: _controller,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                        ),
                        itemCount: Images.length,
                        itemBuilder: (context, index) {
                          final int indexfinal = index + 1;
                          return GestureDetector(
                            onTap: () {
                              ref
                                  .read(workspaceProvider.notifier)
                                  .selectWorkspace(
                                    Images[index],
                                    indexfinal,
                                  );
                              Get.offAll(() => const MainPages());
                            },

                            // Main WorkSpace Cards
                            child: WorkSpaceCard(
                                cardHeight: 160,
                                cardWidth: 160,
                                workspaceCount: indexfinal,
                                workspaceImg: Images[index]),
                          );
                        }),
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
