

part of 'main_shell_viewmodel.dart';

abstract class MainShellViewmodelState {}

class MainShellViewmodelInitial extends MainShellViewmodelState {}

class MainShellViewmodelChangeLanguage extends MainShellViewmodelState {
  MainShellViewmodelChangeLanguage(this.currentLanguage);
  final Locale currentLanguage;
}

class MainShellViewmodelChangeSelectedIndex extends MainShellViewmodelState {
  MainShellViewmodelChangeSelectedIndex(this.selectedIndex);
  final int selectedIndex;
}