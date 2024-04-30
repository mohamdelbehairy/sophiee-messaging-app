// import 'package:app/cubit/theme/theme_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class ThemeCubit extends Cubit<ThemeState> {
//   ThemeCubit() : super(ThemeInitial()) {
//     getDarkMode().then((value) {
//       isDark = value ?? false;
//       emit(ThemeSuccess());
//     });
//   }
//
//   bool isDark = false;
//   void changeAppTheme() {
//     isDark = !isDark;
//     emit(ThemeSuccess());
//     saveDarkMode(isDark: isDark);
//   }
//
//   Future<void> saveDarkMode({required bool isDark}) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('isDark', isDark);
//   }
//
//   Future<bool?> getDarkMode() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getBool('isDark');
//   }
// }
