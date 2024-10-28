import 'package:flutter/material.dart';
import 'package:tugas_1/styles.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    required this.controller, 
    required this.inputType, 
    required this.inputAction, 
    required this.hint, 
    this.isObscure = false, 
    this.hasSuffix = false,
    this.onPressed,
    super.key
  });

  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final String hint;
  final bool isObscure;
  final bool hasSuffix;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyles.body,
      keyboardType: inputType,
      textInputAction: inputAction,
      obscureText: isObscure,
      decoration: InputDecoration(
          suffixIcon: hasSuffix ? IconButton(
            onPressed: onPressed, 
            icon: Icon(
              isObscure ? Icons.visibility : Icons.visibility_off
            ),
          ) : null,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.0, color: AppColors.darkGrey),
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.0, color: AppColors.darkGrey),
            borderRadius: BorderRadius.circular(5.0),
          ),
          hintText: hint,
          hintStyle: TextStyles.body),
    );
  }
}
