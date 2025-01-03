import 'package:emergency_care/config/themes/text_styles.dart';
import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.title,
    this.titleStyle,
    this.trailing,
    this.leadingIcon,
    this.onTap,
  });

  final String title;
  final Widget? trailing;
  final Widget? leadingIcon;
  final VoidCallback? onTap;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingIcon,
      title: Text(
        title,
        style: titleStyle ??
            TextStyles.subtitle.copyWith(fontWeight: FontWeight.w600),
      ),
      trailing: trailing,
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
