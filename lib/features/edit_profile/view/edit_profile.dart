import 'package:easy_localization/easy_localization.dart';
import 'package:emergency_care/config/themes/text_styles.dart';
import 'package:emergency_care/core/constants/validators.dart';
import 'package:emergency_care/core/utils/methods/methods.dart';
import 'package:emergency_care/features/auth/views/widgets/main_button.dart';
import 'package:emergency_care/features/auth/views/widgets/phone_number_field.dart';
import 'package:emergency_care/core/utils/shared/edit_form_field.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  initState() {
    fullnameController.text = 'John Doe';
    emailController.text = 'youremail@domain.com';
    phoneController.text = '1275314934';
    phoneController.addListener(
      () {
        kDebugPrint("phoneController: ${phoneController.text}");
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    fullnameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'edit_profile.title'.tr(),
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
                label: 'edit_profile.name'.tr(),
                controller: fullnameController,
                validator: Validators.validateName,
              ),
              const SizedBox(height: 16),
              EditFormField(
                label: 'edit_profile.email'.tr(),
                controller: emailController,
                validator: Validators.validateEmail,
              ),
              const SizedBox(height: 16),
              EditFormField(
                label: 'edit_profile.phone'.tr(),
                content: PhoneNumberField(
                  controller: phoneController,
                  onChanged: (String value) {},
                  fillColor: Color(0xffF3F8FF),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.45),
              MainButton(
                text: 'edit_profile.button'.tr(),
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
