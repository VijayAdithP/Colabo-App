import 'package:flutter/material.dart';

import 'package:colabomobileapp/Constants/TextThemes.dart';
import 'package:colabomobileapp/Constants/colors.dart';

class Createcards extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final Function(String?) function;
  final bool showObscure;
  final bool forgorPass;
  bool showPassword;
  Icon? prefixIcon;
  Icon? suffixIcon;
  double? height;

  Createcards({
    super.key,
    required this.label,
    required this.controller,
    required this.function,
    this.showObscure = false,
    this.forgorPass = false,
    this.showPassword = false,
    this.prefixIcon,
    this.suffixIcon,
    this.height = 20,
  });

  @override
  State<Createcards> createState() => _CreatecardsState();
}

class _CreatecardsState extends State<Createcards> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.label,
              style: AppTextTheme.allTextTheme.labelSmall,
            ),
            if (widget.forgorPass)
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Forgot Password?",
                  style: AppTextTheme.allTextTheme.labelSmall!.copyWith(
                    color: ConstantColors.primaryGreen,
                    fontSize: 13,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          cursorColor: ConstantColors.primaryGreen,
          obscureText: widget.showPassword,
          onChanged: (value) {
            widget.function(value);
          },
          controller: widget.controller,
          style: AppTextTheme.allTextTheme.labelLarge,
          decoration: InputDecoration(
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: widget.height!,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
              borderSide: BorderSide(
                color: ConstantColors.borderGrey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
              borderSide: BorderSide(
                color: ConstantColors.borderGrey,
              ),
            ),
          ),
        )
      ],
    );
  }
}
