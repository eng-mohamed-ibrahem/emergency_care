import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:emergency_care/config/themes/text_styles.dart';
import 'package:emergency_care/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:intl_phone_field/phone_number.dart';
import 'package:phone_form_field/phone_form_field.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField(
      {super.key,
      this.controller,
      this.onChanged,
      this.validator,
      this.fillColor});
  final TextEditingController? controller;
  final dynamic Function(PhoneNumber)? onChanged;
  final String? Function(PhoneNumber?)? validator;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return PhoneFormField(
      initialValue: PhoneNumber.parse('+20'),
      validator: PhoneValidator.compose([
        PhoneValidator.required(
          context,
          errorText: 'auth.invalid.phone_length'.tr(),
        ),
        PhoneValidator.validMobile(
          context,
          errorText: 'auth.invalid.phone_length'.tr(),
        ),
      ]),
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      countrySelectorNavigator: CountrySelectorNavigator.draggableBottomSheet(
        searchBoxTextStyle: TextStyles.subtitle,
        borderRadius: BorderRadius.circular(12),
        searchBoxDecoration: InputDecoration(
          hintText: 'sign_up.search'.tr(),
          filled: true,
          fillColor: Color(0xFfC4C4C4).withAlpha(20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      onChanged: onChanged,
      enabled: true,
      decoration: InputDecoration(
        hintText: "sign_up.phone".tr(),
        filled: true,
        fillColor: fillColor ?? Color(0xFfC4C4C4).withAlpha(20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        // prefixIcon: Icon(
        //   Icons.phone_iphone_rounded,
        //   color: AppColors.iconUnselectedColor,
        //   size: 24.sp,
        // ),
      ),
      isCountrySelectionEnabled: true,
      isCountryButtonPersistent: true,
      countryButtonStyle: const CountryButtonStyle(
        showDialCode: true,
        showFlag: true,
      ),
      style: TextStyles.subtitle,
      cursorColor: AppColors.primaryColor,
    );

    // return IntlPhoneField(
    //   controller: controller,
    //   initialValue: controller?.text,
    //   validator: validator,
    //   autovalidateMode: AutovalidateMode.onUserInteraction,
    //   initialCountryCode: "EG",
    //   dropdownIconPosition: IconPosition.trailing,
    //   textInputAction: TextInputAction.next,
    //   textAlign: Directionality.of(context) == TextDirection.rtl
    //       ? TextAlign.right
    //       : TextAlign.left,
    //   decoration: InputDecoration(
    //     hintText: "sign_up.phone".tr(),
    //     filled: true,
    //     fillColor: fillColor ?? Color(0xFfC4C4C4).withAlpha(20),
    //     border: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(12),
    //       borderSide: BorderSide.none,
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(12),
    //       borderSide: BorderSide.none,
    //     ),
    //     prefixIcon: Icon(
    //       Icons.phone_iphone_rounded,
    //       color: AppColors.iconUnselectedColor,
    //       size: 24.sp,
    //     ),
    //   ),
    //   dropdownTextStyle: TextStyles.subtitle,
    //   dropdownDecoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(12),
    //     border: Border.all(color: Colors.transparent),
    //   ),
    //   pickerDialogStyle: PickerDialogStyle(
    //     backgroundColor: Colors.white,
    //     countryNameStyle: TextStyles.subtitle,
    //     countryCodeStyle: TextStyles.subtitle,
    //     searchFieldInputDecoration: InputDecoration(
    //       hintText: 'sign_up.search'.tr(),
    //       filled: true,
    //       fillColor: Color(0xFfC4C4C4).withAlpha(20),
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(12),
    //         borderSide: BorderSide.none,
    //       ),
    //       focusedBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(12),
    //         borderSide: BorderSide.none,
    //       ),
    //     ),
    //   ),
    //   flagsButtonPadding: const EdgeInsets.symmetric(horizontal: 15),
    //   invalidNumberMessage: 'auth.invalid.phone_length'.tr(),
    //   style: TextStyles.subtitle,
    //   cursorColor: AppColors.primaryColor,
    //   onChanged: (phone) {
    //     onChanged?.call(phone.completeNumber);
    //   },
    // );
  }
}
