import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_shell_viewmodel_state.dart';

class MainShellViewmodel extends Cubit<MainShellViewmodelState> {
  MainShellViewmodel() : super(MainShellViewmodelInitial());
  Locale? currentLanguage;
  int selectedIndex = 0;

  void changeLanguage(Locale locale) {
    currentLanguage = locale;
    emit(MainShellViewmodelChangeLanguage(locale));
  }

  void changeSelectedIndex(int index) {
    selectedIndex = index;
    emit(MainShellViewmodelChangeSelectedIndex(index));
  }
}
