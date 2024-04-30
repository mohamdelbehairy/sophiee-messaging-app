import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sophiee/models/users_model.dart';

part 'google_auth_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit() : super(GoogleAuthInitial());

  bool isLoading = false;
  Future<UserCredential?> signInWithGoogle() async {
    emit(GoogleAuthLoading());

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        final userCredentail =
            await FirebaseAuth.instance.signInWithCredential(credential);

        if (userCredentail.user != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('userID', userCredentail.user!.uid);

          if (!await isUserDataStored(userID: userCredentail.user!.uid)) {
            await googleAuthStoreUserData(userCredentail: userCredentail);
          }
          emit(GoogleAuthSuccess(isLoading: true));
          return userCredentail;
        }
      }
    } catch (e) {
      debugPrint('error from sign in with google method: ${e.toString()}');
      isLoading = false;
      emit(GoogleAuthFailure(errorMessage: e.toString()));
    }
    return null;
  }

  Future<bool> isUserDataStored({required String userID}) async {
    final docSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();
    return docSnapshot.exists;
  }

  Future<void> googleAuthStoreUserData(
      {required UserCredential userCredentail}) async {
    UserModel userModel = UserModel.fromJson({
      'userName': userCredentail.user!.displayName,
      'emailAddress': userCredentail.user!.email,
      'userID': userCredentail.user!.uid,
      'profileImage': userCredentail.user!.photoURL,
      'onlineStatue': Timestamp.now(),
      'isStory': false,
      'isGoogleAuth': true
    });
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredentail.user!.uid)
        .set(userModel.toMap());
  }
}
