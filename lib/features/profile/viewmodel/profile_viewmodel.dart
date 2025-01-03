import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_viewmodel_state.dart';

class ProfileViewmodel extends Cubit<ProfileViewmodelState> {
  ProfileViewmodel() : super(ProfileViewmodelInitial());
  
  void changeLanguage(Locale locale) {
    emit(ProfileViewmodelChangeLanguage(locale));
  }
}
