import 'dart:typed_data';

import 'package:another_telephony/telephony.dart';
import 'package:direct_call_plus/direct_call_plus.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
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
        title: Text("Contacts"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: SearchBar(
            hintText: 'Search',
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor: WidgetStatePropertyAll(
              Colors.white,
            ),
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
                        (contact) => contact.displayName.toLowerCase().contains(
                              value.toLowerCase(),
                            ),
                      )
                      .toList();
                },
              );
            },
            onTap: () {
              isSearching = true;
            },
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onSubmitted: (value) {
              // print(value);
            },
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

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.contact,
  });

  final Contact contact;

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
      child: Row(
        children: [
          ContactImage(contact: contact),
          Expanded(
            child: Column(
              spacing: 10,
              children: [
                Text(
                  contact.displayName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  contact.phones.isNotEmpty
                      ? contact.phones
                          .map(
                            (e) => e.number,
                          )
                          .join('\n')
                      : '',
                ),
              ],
            ),
          ),
          Row(
            spacing: 10,
            children: [
              IconButton(
                icon: const Icon(Icons.call),
                onPressed: () async {
                  var phoneNumber = contact.phones.first.number;
                  bool? res = await DirectCallPlus.makeCall(phoneNumber);
                },
              ),
              IconButton(
                icon: const Icon(Icons.message),
                onPressed: () async {
                  final telephony = Telephony.instance;
                  bool permissionsGranted =
                      await telephony.requestPhoneAndSmsPermissions ?? false;

                  if (permissionsGranted) {
                    var phoneNumber = contact.phones.first.number;
                    await telephony.sendSms(
                      // to: "01221764035",
                      to: phoneNumber,
                      message: "Message from Flutter project",
                    );
                  }
                },
              ),
            ],
          ),
        ],
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
