import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  bool isLoading = false;
  Future<void> register(
      {required String emailAddress, required String password}) async {
    emit(RegisterLoading(isLoading: true));
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password);

      if (userCredential.user != null) {
        emit(RegisterSuccess());
        emit(RegisterLoading(isLoading: false));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errorMessage: 'weak-password'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errorMessage: 'email-already-in-use'));
      }
      emit(RegisterLoading(isLoading: false));
    } catch (e) {
      debugPrint('error from register cubit: $e');
      emit(RegisterFailure(errorMessage: e.toString()));
      emit(RegisterLoading(isLoading: false));
    }
  }
}
