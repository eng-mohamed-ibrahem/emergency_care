import 'dart:typed_data';

import 'package:emergency_care/config/themes/text_styles.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatefulWidget {
  const ContactCard({
    super.key,
    required this.contact,
  });

  final Contact contact;

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  bool isPhoneSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      child: ExpansionTile(
        leading: ContactImage(contact: widget.contact),
        tilePadding: EdgeInsets.zero,
        title: Text(
          widget.contact.displayName,
          style: TextStyles.middleTitle,
        ),
        shape: RoundedRectangleBorder(),
        children: widget.contact.phones.map(
          (phone) {
            return TextButton.icon(
              onPressed: () {
                setState(() {
                  isPhoneSelected = !isPhoneSelected;
                });
              },
              label: Text(
                phone.number,
                style: TextStyles.subtitle,
              ),
              icon: isPhoneSelected
                  ? Icon(
                      Icons.check_circle_rounded,
                      color: Colors.blue,
                    )
                  : Icon(
                      Icons.check_circle_outlined,
                      color: Colors.blue.shade200,
                    ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class ContactImage extends StatefulWidget {
  const ContactImage({
    super.key,
    required this.contact,
  });

  final Contact contact;

  @override
  ContactImageState createState() => ContactImageState();
}

class ContactImageState extends State<ContactImage> {
  late Future<Uint8List?> _imageFuture;

  @override
  void initState() {
    super.initState();
    _imageFuture = FastContacts.getContactImage(widget.contact.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: _imageFuture,
      builder: (context, snapshot) => SizedBox(
        width: 56,
        height: 56,
        child: snapshot.hasData
            ? CircleAvatar(
                radius: 28,
                backgroundImage: MemoryImage(snapshot.data!),
                // child: Image.memory(snapshot.data!, gaplessPlayback: true),
              )
            : Icon(Icons.account_box_rounded),
      ),
    );
  }
}
          // Row(
          //   spacing: 10,
          //   children: [
          //     IconButton(
          //       icon: const Icon(Icons.call),
          //       onPressed: () async {
          //         var phoneNumber = contact.phones.first.number;
          //         await DirectCallPlus.makeCall(phoneNumber);
          //       },
          //     ),
          //     IconButton(
          //       icon: const Icon(Icons.message),
          //       onPressed: () async {
          //         final telephony = Telephony.instance;
          //         bool permissionsGranted =
          //             await telephony.requestPhoneAndSmsPermissions ?? false;

          //         if (permissionsGranted) {
          //           var phoneNumber = contact.phones.first.number;
          //           await telephony.sendSms(
          //             to: phoneNumber,
          //             message: "Message from Flutter project",
          //           );
          //         }
          //       },
          //     ),
          //   ],
          // ),