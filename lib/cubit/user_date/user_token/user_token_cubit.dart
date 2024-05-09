import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_token_state.dart';

class UserTokenCubit extends Cubit<UserTokenState> {
  UserTokenCubit() : super(UserTokenInitial());

  Future<String?> getUserToken() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      debugPrint('token: $token');
      emit(GetTokenSuccess());
      return token ?? '';
    }  catch (e) {
       emit(UserTokenFailure(errorMessage: e.toString()));
      debugPrint('error from get user token: ${e.toString()}');
    }
    return null;
  }

  Future<void> updateUserToken({required String? token}) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'token': token});
      emit(UpdateTokenSuccess());
    } catch (e) {
      emit(UserTokenFailure(errorMessage: e.toString()));
      debugPrint('error from update user token: ${e.toString()}');
    }
  }
}
