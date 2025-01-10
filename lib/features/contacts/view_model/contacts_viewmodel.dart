import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contacts._viewmodel_state.dart';

class ContactsViewmodel extends Cubit<ContactsViewmodelstate> {
  ContactsViewmodel() : super(ContactsInitialState());


}
