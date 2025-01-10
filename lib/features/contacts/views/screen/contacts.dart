import 'package:easy_localization/easy_localization.dart';
import 'package:emergency_care/config/themes/text_styles.dart';
import 'package:emergency_care/core/utils/shared/input_form_field.dart';
import 'package:emergency_care/features/contacts/views/widgets/contact_card.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  bool isLoading = true;
  List<Contact> contacts = [];
  List<Contact> searched = [];
  bool isSearching = false;

  @override
  void initState() {
    Permission.contacts.request().then(
      (value) {
        // Get all contacts
        FastContacts.getAllContacts().then(
          (contacts) {
            setState(() {
              isLoading = false;
              this.contacts = contacts;
            });
          },
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "contacts.title".tr(),
          style: TextStyles.middleTitle,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.h),
          child: TapRegion(
            onTapInside: (event) {
              isSearching = true;
            },
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: InputFormField(
              hintText: 'contacts.search'.tr(),
              onChanged: (value) {
                if (value.isEmpty) {
                  isSearching = false;
                } else {
                  isSearching = true;
                }
                setState(
                  () {
                    // search contacts
                    searched = contacts
                        .where(
                          (contact) =>
                              contact.displayName.toLowerCase().contains(
                                    value.toLowerCase(),
                                  ),
                        )
                        .toList();
                  },
                );
              },
            ),
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: isSearching ? searched.length : contacts.length,
              itemBuilder: (context, index) {
                return ContactCard(
                    contact: isSearching ? searched[index] : contacts[index]);
              },
            ),
    );
  }
}
