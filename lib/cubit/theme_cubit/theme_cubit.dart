import 'package:ema/cubit/theme_cubit/theme_state.dart';
import 'package:ema/shared/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(LightTheme());
  SwitchTheme({required bool value}) {
    darkMode = value;
    if (darkMode == true){
      emit(LightTheme());
      }
    else {
      emit(DarkTheme()
      );
      }
    
  }
}
