import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_settings_state.dart';

class AuthSettingsCubit extends Cubit<AuthSettingsState> {
  AuthSettingsCubit() : super(AuthSettingsInitial());

  Future<void> forgetPassword({required String email}) async {
    emit(AuthSettingsLoading());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(ResetPasswordSuccess());
    } catch (e) {
      emit(AuthSettingsFailure(errorMessage: e.toString()));
      debugPrint('error from forget password method: ${e.toString()}');
    }
  }

  Future<void> signOut() async {
    emit(AuthSettingsLoading());
    try {
      await FirebaseAuth.instance.signOut();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      emit(EmailSignOutSuccess());
    } catch (e) {
      emit(AuthSettingsFailure(errorMessage: e.toString()));
      debugPrint('error from email sign out method: ${e.toString()}');
    }
  }

  Future<void> googleSignOut() async {
    emit(AuthSettingsLoading());
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      emit(GoogleSignOutSuccess());
    } catch (e) {
      emit(AuthSettingsFailure(errorMessage: e.toString()));
      debugPrint('error from google sign out method: ${e.toString()}');
    }
  }

  Future<void> verificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      emit(VerificationEmailSuccess());
    } catch (e) {
      emit(AuthSettingsFailure(errorMessage: e.toString()));
      debugPrint('error from verification email method: ${e.toString()}');
    }
  }
}
