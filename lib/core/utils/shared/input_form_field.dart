import 'package:emergency_care/config/themes/text_styles.dart';
import 'package:emergency_care/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputFormField extends StatefulWidget {
  final bool isPassword;
  final String? hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final String? Function(String? text)? validator;
  final Color? fillColor;

  const InputFormField({
    super.key,
    this.isPassword = false,
     this.hintText,
    this.prefixIcon,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.onChanged,
    this.validator,
    this.fillColor,
  });

  @override
  State<InputFormField> createState() => _InputFormState();
}

class _InputFormState extends State<InputFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      validator: widget.validator,
      obscureText: widget.isPassword ? _obscureText : false,
      cursorColor: AppColors.primaryColor,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: widget.fillColor ?? Color(0xFfC4C4C4).withAlpha(20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        prefixIcon: widget.isPassword
            ? Icon(
                Icons.lock_outline,
                color: AppColors.iconUnselectedColor,
                size: 24.sp,
              )
            : widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.iconUnselectedColor,
                  size: 24.sp,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyles.subtitle,
      selectionControls: MaterialTextSelectionControls(),
    );
  }
}
