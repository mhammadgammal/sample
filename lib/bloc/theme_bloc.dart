import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/cache/cache_helper.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false);

  static ThemeCubit get(BuildContext context) => BlocProvider.of(context);
  bool? appTheme = false;
  void getTheme(bool? isDark) {
    if (isDark != null) {
      appTheme = CacheHelper.getBoolean('is_dark');
      emit(appTheme!);
    } else {
      appTheme = !appTheme!;
      emit(appTheme!);
    }
  }

  void changeTheme(bool isDark) {
    appTheme = isDark;
    CacheHelper.putBoolean('is_dark', isDark);
    emit(appTheme!);
  }
}
