import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false);

  static get(BuildContext context) => BlocProvider.of(context);
  void changeTheme(bool isDark) => emit(!isDark);
}
