import 'package:emergency_care/config/themes/text_styles.dart';
import 'package:emergency_care/core/utils/shared/input_form_field.dart';
import 'package:flutter/material.dart';

class EditFormField extends StatelessWidget {
  const EditFormField({
    super.key,
    required this.label,
    this.controller,
    this.validator,
    this.content,
  });

  final String label;
  final TextEditingController? controller;
  final String? Function(String? text)? validator;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xffF3F8FF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey[400]!,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyles.miniTitle.copyWith(
              color: Colors.grey[500],
            ),
          ),
          content ??
              InputFormField(
                controller: controller,
                fillColor: Color(0xffF3F8FF),
                validator: validator,
              ),
        ],
      ),
    );
  }
}
