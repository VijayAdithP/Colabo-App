import 'package:colabomobileapp/Constants/ConstantText.dart';
import 'package:colabomobileapp/Constants/TextThemes.dart';
import 'package:colabomobileapp/Constants/colors.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final Function(String?) function;
  final bool showObscure;
  final bool forgorPass;
  bool showPassword;
  AuthTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.function,
    this.showObscure = false,
    this.forgorPass = false,
    this.showPassword = false,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
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
                  ConstantText.AuthworkForgotPassword,
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
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  widget.showPassword = !widget.showPassword;
                });
              },
              icon: Icon(
                (widget.showObscure && widget.controller.text.isNotEmpty)
                    ? widget.showPassword
                        ? Icons.visibility
                        : Icons.visibility_off
                    : null,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
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
