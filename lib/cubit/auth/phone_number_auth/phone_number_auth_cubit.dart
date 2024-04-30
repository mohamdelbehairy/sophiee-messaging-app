import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'phone_number_auth_state.dart';

class PhoneNumberAuthCubit extends Cubit<PhoneNumberAuthState> {
  PhoneNumberAuthCubit() : super(PhoneNumberAuthInitial());

  String verificationID = '';
  bool isLoading = false;
  Future<void> signInWithPhoneNumber({required String phoneNumber}) async {
    emit(PhoneNumberAuthLoading(isLoading: true));
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          emit(
              SendPhoneNumberAuthFailure(errorMessage: 'invalid-phone-number'));
        } else if (e.code == 'too-many-requests') {
          emit(SendPhoneNumberAuthFailure(errorMessage: 'too-many-requests'));
        } else if (e.code == 'network-request-failed') {
          emit(SendPhoneNumberAuthFailure(
              errorMessage: 'network-request-failed'));
        } else {
          emit(SendPhoneNumberAuthFailure(errorMessage: e.toString()));
        }

        debugPrint(
            'error from sign in with phone number method: ${e.toString()}');
        isLoading = false;
      },
      codeSent: (String verificationId, int? resendToken) {
        emit(SendPhoneNumberAuthSuccess());
        verificationID = verificationId;
        isLoading = false;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> verifyPhoneNumber({required String smsCode}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationID, smsCode: smsCode);

      await FirebaseAuth.instance.signInWithCredential(credential);

      emit(VerifyPhoneNumberAuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(VerifyPhoneNumberAuthFailure(
          errorMessage: 'invalid-verification-code'));
      debugPrint('error from verify phone number method: ${e.toString()}');
    } catch (e) {
      emit(VerifyPhoneNumberAuthFailure(errorMessage: e.toString()));
      debugPrint('error from verify phone number method: ${e.toString()}');
    }
  }
}
