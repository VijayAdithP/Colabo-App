import '../../Constants/colors.dart';
import 'package:flutter/material.dart';

// used in the login page above the textfields

class Backgroundimage extends StatelessWidget {
  const Backgroundimage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.sizeOf(context).height;
    final mediaWidth = MediaQuery.sizeOf(context).width;
    return Container(
      color: ConstantColors.appBarLogin,
      height: mediaHeight * 0.33,
      width: mediaWidth,
      child: Stack(
        children: [
          Positioned(
            width: mediaWidth,
            child: Image.asset(
              "asset/images/name3.png",
            ),
          ),
          Positioned(
            bottom: 20,
            right: mediaWidth * 0.4,
            child: Image.asset(
              height: 20,
              "asset/images/name.png",
            ),
          ),
          Positioned(
            top: mediaHeight * 0.05,
            right: mediaWidth * 0.29,
            child: Image.asset(
              height: 180,
              "asset/images/name2.png",
            ),
          ),
        ],
      ),
    );
  }
}
