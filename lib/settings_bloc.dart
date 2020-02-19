
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  @override
  SettingsState get initialState => InitialSettingsState();

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is FontSize) {
      yield NewSettingState.fromOldSettingState(initialState,
          sliderFontSize: event.payload);
    } else if (event is Bold) {
      yield NewSettingState.fromOldSettingState(initialState,
          isBold: event.payload);
    } else if (event is Italic) {
      yield NewSettingState.fromOldSettingState(initialState,
          isItalic: event.payload);
    }
  }

  void dispatch(SettingsEvent settingsEvent) {
    NewSettingState.fromOldSettingState(initialState,
        sliderFontSize: settingsEvent.payload);
  }
}
