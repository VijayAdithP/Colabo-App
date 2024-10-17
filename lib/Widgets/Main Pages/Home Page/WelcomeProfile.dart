import '../../../Constants/TextThemes.dart';
import '../../../Constants/colors.dart';
import 'package:flutter/material.dart';

class WelcomeProfile extends StatelessWidget {
  final String userName;
  final String userProfileImg;
  const WelcomeProfile({
    super.key,
    required this.userName,
    required this.userProfileImg,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome,",
                style: AppTextTheme.allTextTheme.titleSmall,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "$userName!",
                style: AppTextTheme.allTextTheme.titleLarge,
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: ConstantColors.secondaryScaffoldBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                height: 60,
                userProfileImg,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
