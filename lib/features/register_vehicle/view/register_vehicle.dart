import 'package:easy_localization/easy_localization.dart';
import 'package:emergency_care/config/themes/text_styles.dart';
import 'package:emergency_care/core/constants/app_colors.dart';
import 'package:emergency_care/core/constants/assets_manager.dart';
import 'package:emergency_care/core/constants/validators.dart';
import 'package:emergency_care/core/utils/methods/methods.dart';
import 'package:emergency_care/features/auth/views/widgets/auth_button.dart';
import 'package:emergency_care/features/auth/views/widgets/input_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterVehicle extends StatefulWidget {
  const RegisterVehicle({super.key});

  @override
  State<RegisterVehicle> createState() => _RegisterVehicleState();
}

class _RegisterVehicleState extends State<RegisterVehicle> {
  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _vehicleNumberController =
      TextEditingController();
  final TextEditingController _vehicleColorController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _ownerNameController.dispose();
    _vehicleNumberController.dispose();
    _vehicleColorController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "register_vehicle.dnt_show".tr(),
                style: TextStyles.subtitle.copyWith(
                  color: AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // handle tap to store data in locale storage
                  },
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 20),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.textColor,
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'register_vehicle.skip'.tr(),
                style: TextStyles.buttonTextStyle,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                RepaintBoundary(
                  child: Image.asset(
                    AssetsManager.registerVehiclePngImage,
                    width: 360.w,
                    height: 200.h,
                    fit: BoxFit.contain,
                  ),
                ),
                // RepaintBoundary(
                //   child: SvgPicture.asset(
                //     AssetsManager.registerVehicleSvgImage,
                //     width: 360.w,
                //     height: 200.h,
                //     fit: BoxFit.contain,
                //   ),
                // ),
                const SizedBox(height: 20),
                Text(
                  'register_vehicle.title'.tr(),
                  style: TextStyles.title.copyWith(
                    fontSize: 36.sp,
                  ),
                ),
                const SizedBox(height: 20),

                // vehicle owner name
                InputFormField(
                  controller: _ownerNameController,
                  hintText: 'register_vehicle.vehicle_owner_name'.tr(),
                  textInputAction: TextInputAction.next,
                  validator: (text) {
                    return Validators.validateName(
                      text,
                      requiredMessage:
                          'register_vehicle.required.vehicle_owner_name'.tr(),
                      invalidMessage:
                          'register_vehicle.invalid.vehicle_owner_name'.tr(),
                    );
                  },
                ),
                const SizedBox(height: 10),

                // vehilce number
                InputFormField(
                  controller: _vehicleNumberController,
                  hintText: 'register_vehicle.vehicle_number'.tr(),
                  textInputAction: TextInputAction.next,
                  validator: (text) {
                    return Validators.validateName(
                      text,
                      requiredMessage:
                          'register_vehicle.required.vehicle_number'.tr(),
                      invalidMessage:
                          'register_vehicle.invalid.vehicle_number'.tr(),
                    );
                  },
                ),

                const SizedBox(height: 10),

                //vehicle color
                InputFormField(
                  controller: _vehicleColorController,
                  hintText: 'register_vehicle.vehicle_color'.tr(),
                  textInputAction: TextInputAction.done,
                  validator: (text) {
                    return Validators.validateName(
                      text,
                      requiredMessage:
                          'register_vehicle.required.vehicle_color'.tr(),
                      invalidMessage:
                          'register_vehicle.invalid.vehicle_color'.tr(),
                    );
                  },
                ),

                SizedBox(height: MediaQuery.sizeOf(context).height * 0.25),

                // Register Button
                AuthButton(
                  text: 'register_vehicle.button'.tr(),
                  onPressed: () {
                    // Handle register button tap
                    if (_formKey.currentState!.validate()) {
                      kDebugPrint('register vehicle ...');
                    }
                  },
                ),

                const SizedBox(height: 5),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'register_vehicle.note_title'.tr(),
                            style: TextStyles.subtitle
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "register_vehicle.note".tr(),
                            style: TextStyles.subtitle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
