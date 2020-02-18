
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState>{
  SettingsState currentState;

  @override
  // TODO: implement initialState
  SettingsState get initialState => InitialSettingsState();

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    // TODO: implement mapEventToState
    if (event is FontSize) {
      yield NewSettingsState.fromOldSettingsState(currentState,
          sliderFontSize: event.payload);
    } else if (event is Bold) {
      yield NewSettingsState.fromOldSettingsState(currentState,
          isBold: event.payload);
    } else if (event is Italic) {
      yield NewSettingsState.fromOldSettingsState(currentState,
          isItalic: event.payload);
    }
  }

  void dispatch(SettingsEvent event) {
    mapEventToState(event);
  }






  }
