import 'package:asgard_test/core/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

abstract class ThemeEvent {}

class ToggleTheme extends ThemeEvent {}

class ThemeState {
  final ThemeData themeData;

  ThemeState(this.themeData);
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(AppTheme.lightTheme)) {
    on<ToggleTheme>(_onToggleTheme);
  }

  void _onToggleTheme(ToggleTheme event, Emitter<ThemeState> emit) {
    if (state.themeData == AppTheme.lightTheme) {
      emit(ThemeState(AppTheme.darkTheme));
    } else {
      emit(ThemeState(AppTheme.lightTheme));
    }
  }
}
