

import 'package:cubit_demo/main.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
 

class ThemeState extends Equatable {
  const ThemeState({this.themeMode = ThemeMode.light}); // Default theme = light theme

  final ThemeMode themeMode;

  // `copyWith()` method allows us to emit brand new instance of ThemeState
  ThemeState copyWith({ThemeMode? themeMode}) {
    logger.d("----------000000----theme mode-----${themeMode?.index}");
    return ThemeState(
    themeMode: themeMode ?? this.themeMode,
  );
  }

  @override
  List<Object?> get props => [themeMode];
}