part of 'profile_viewmodel.dart';

abstract class ProfileViewmodelState {}

class ProfileViewmodelInitial extends ProfileViewmodelState {}

class ProfileViewmodelChangeLanguage extends ProfileViewmodelState {
  ProfileViewmodelChangeLanguage(this.currentLanguage);
  final Locale currentLanguage;
}
