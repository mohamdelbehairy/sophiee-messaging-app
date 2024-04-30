import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial()) {
    getDarkMode().then((value) {
      isDark = value ?? false;
      emit(AppThemeChanged());
    });
  }

  Future<void> login(
      {required String emailAddress,
      required String password,
      required BuildContext context}) async {
    emit(LoginLoading());
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      if (userCredential.user != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('userID', userCredential.user!.uid);
        debugPrint(userCredential.user!.uid);
        emit(LoginSuccess());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        emit(LoginFailure(errorMessage: 'invalid-credential'));
      }
    } catch (e) {
      emit(LoginFailure(errorMessage: e.toString()));
    }
  }

  bool isDark = false;
  void changeAppTheme() {
    isDark = !isDark;
    emit(AppThemeChanged());
    // saveDarkMode(isDark: isDark);
  }

  Future<void> saveDarkMode({required bool isDark}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDark);
  }

  Future<bool?> getDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isDarkMode');
  }
}
