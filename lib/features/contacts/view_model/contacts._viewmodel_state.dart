
part of 'contacts_viewmodel.dart';

abstract class ContactsViewmodelstate {}

class ContactsInitialState extends ContactsViewmodelstate {}

class GetContactsloadingState extends ContactsViewmodelstate {}

class GetContactsSuccessState extends ContactsViewmodelstate {
  GetContactsSuccessState(this.contacts);
  final List<Contact> contacts;
}

class GetContactsFailureState extends ContactsViewmodelstate {
  final String failure;
  GetContactsFailureState(this.failure);
}
