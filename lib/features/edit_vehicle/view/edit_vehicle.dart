import 'package:easy_localization/easy_localization.dart';
import 'package:emergency_care/config/themes/text_styles.dart';
import 'package:emergency_care/core/constants/validators.dart';
import 'package:emergency_care/core/utils/methods/methods.dart';
import 'package:emergency_care/features/auth/views/widgets/main_button.dart';
import 'package:emergency_care/core/utils/shared/edit_form_field.dart';
import 'package:flutter/material.dart';

class EditVehicleScreen extends StatefulWidget {
  const EditVehicleScreen({super.key});

  @override
  State<EditVehicleScreen> createState() => _EditVehicleScreenState();
}

class _EditVehicleScreenState extends State<EditVehicleScreen> {
  final TextEditingController ownerName = TextEditingController();
  final TextEditingController vehicleNumber = TextEditingController();
  final TextEditingController vehicleColor = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    ownerName.text = "Mohamde ibrahem mohamed";
    vehicleNumber.text = " ا س ب / 1 2 3";
    vehicleColor.text = "Black";
    super.initState();
  }

  @override
  void dispose() {
    ownerName.dispose();
    vehicleNumber.dispose();
    vehicleColor.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'edit_vehicle.title'.tr(),
          style: TextStyles.middleTitle,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              EditFormField(
                label: 'edit_vehicle.owner_name'.tr(),
                controller: ownerName,
                validator: Validators.validateName,
              ),
              const SizedBox(height: 16),
              EditFormField(
                label: 'edit_vehicle.number'.tr(),
                controller: vehicleNumber,
                validator: (text) {
                  return Validators.validateName(
                    text,
                    requiredMessage:
                        'register_vehicle.required.vehicle_number'.tr(),
                    invalidAfter: 2,
                    invalidMessage:
                        'register_vehicle.invalid.vehicle_number'.tr(),
                  );
                },
              ),
              const SizedBox(height: 16),
              EditFormField(
                label: 'edit_vehicle.color'.tr(),
                controller: vehicleColor,
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
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.45),
              MainButton(
                text: 'edit_vehicle.button'.tr(),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // handle form submission
                    kDebugPrint("Form is valid");
                  }
                },
                withIcon: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
