import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sophiee/models/users_model.dart';

part 'facebook_auth_state.dart';

class FacebookAuthCubit extends Cubit<FacebookAuthState> {
  FacebookAuthCubit() : super(FacebookAuthInitial());

  bool isLoading = false;
  Future<UserCredential?> signInWithFacebook({required String? token}) async {
    emit(FacebookAuthLoading());
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.accessToken != null) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);

        final UserCredential userCredential = await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);

        if (userCredential.user != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('userID', userCredential.user!.uid);
          Map<String, dynamic> userData =
              await FacebookAuth.instance.getUserData();

          if ((!await isUserDataStored(userID: userCredential.user!.uid))) {
            await facebookAuthStoreUserData(
                token: token,
                userCredentail: userCredential,
                profileImage: userData['picture']['data']['url']);
          }

          emit(FacebookAuthSuccess(isLoading: true));
          return userCredential;
        }
      }
    } catch (e) {
      debugPrint('error from sign in with facebook method: ${e.toString()}');
      isLoading = false;
      emit(FacebookAuthFailure(errorMessage: e.toString()));
    }
    return null;
  }

  Future<bool> isUserDataStored({required String userID}) async {
    final docSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();
    return docSnapshot.exists;
  }

  Future<void> facebookAuthStoreUserData(
      {required UserCredential userCredentail,
      required String profileImage,
      required String? token}) async {
    UserModel userModel = UserModel.fromJson({
      'userName': userCredentail.user!.displayName,
      'emailAddress': userCredentail.user!.email,
      'phoneNumber': userCredentail.user!.phoneNumber,
      'userID': userCredentail.user!.uid,
      'profileImage': profileImage,
      'onlineStatue': Timestamp.now(),
      'isStory': false,
      'isFacebookAuth': true,
      'token': token,
      'chatbackgroundImage': null,
      'chatbackgroundColor': null,
      'isChatNotify': true,
      'isGroupNotify': true,
      'isStoryNotify': false,
      'isLivesNotify': true,
      'isPinnedMessageNotify': true,
      'isPhoneAndEmail': true,
      'isLastSeendAndOnline': true,
      'isProfilePhotos': true,
      'isDateOfBirth': false,
      'isBioAndNickName': true,
      'isAudioAndVideoCall': true,
      'muteUsers': const []
    });
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredentail.user!.uid)
        .set(userModel.toMap());
  }
}
