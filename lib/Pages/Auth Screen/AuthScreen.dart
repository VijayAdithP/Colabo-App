import 'package:colabomobileapp/Constants/ConstantText.dart';
import 'package:colabomobileapp/Constants/TextThemes.dart';
import 'package:colabomobileapp/Constants/colors.dart';
import 'package:colabomobileapp/Pages/WorkSpace%20Screen/WorkSpaceScreen.dart';
import 'package:colabomobileapp/Widgets/Auth%20Screen/AuthTextField.dart';
import 'package:colabomobileapp/Widgets/Auth%20Screen/backgroundImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Authscreen extends StatefulWidget {
  const Authscreen({super.key});

  @override
  State<Authscreen> createState() => _AuthscreenState();
}

class _AuthscreenState extends State<Authscreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ConstantColors.appBarLogin,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              const Backgroundimage(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ConstantText.AuthloginAccount,
                      style: AppTextTheme.allTextTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AuthTextField(
                      controller: emailController,
                      label: ConstantText.AuthworkEmail,
                      function: (email) {
                        setState(() {
                          emailController.text = email!;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AuthTextField(
                      forgorPass: true,
                      showObscure: true,
                      showPassword: true,
                      controller: passwordController,
                      label: ConstantText.AuthworkPassword,
                      function: (password) {
                        setState(() {
                          passwordController.text = password!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 30,
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.offAll(() => const WorkSpaceScreen());
                  },
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.07,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: ConstantColors.primaryGreen,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        ConstantText.AuthLogin,
                        style: AppTextTheme.allTextTheme.titleSmall!.copyWith(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
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
