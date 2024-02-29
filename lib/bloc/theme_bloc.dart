import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/cache/cache_helper.dart';

import 'theme_stats.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitAppState());

  static AppCubit get(BuildContext context) => BlocProvider.of(context);
  bool? appTheme = false;
  int counterValue = 0;
  void getTheme(bool? isDark) {
    if (isDark != null) {
      appTheme = CacheHelper.getBoolean('is_dark');
      emit(GetThemeState());
    } else {
      appTheme = !appTheme!;
      emit(GetThemeState());
    }
  }

  void changeTheme(bool isDark) {
    appTheme = isDark;
    CacheHelper.putBoolean('is_dark', isDark);
    emit(ToggleThemeState());
  }

  void incrementCounter(String newValue) {
    counterValue = int.parse(newValue);
    ++counterValue;
    emit(IncrementState());
  }
  void decrementCounter(String value) {
  counterValue = int.parse(value);
  --counterValue;
  emit(DecrementState());
  }
}
