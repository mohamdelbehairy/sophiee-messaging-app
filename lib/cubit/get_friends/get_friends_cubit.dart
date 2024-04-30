import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/get_friends/get_friends_state.dart';
import 'package:sophiee/models/users_model.dart';

class GetFriendsCubit extends Cubit<GetFriendsState> {
  GetFriendsCubit() : super(GetFriendsInitial());
  void getFriends({required String userID}) {
    emit(GetFriendsLoading());

    try {
      FirebaseFirestore.instance
          .collection('friends')
          .doc(userID)
          .collection('friends')
          .snapshots()
          .listen((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          List<UserModel> friends =
              snapshot.docs.map((e) => UserModel.fromJson(e.data())).toList();
          if (friends.isNotEmpty) {
            emit(GetFriendsSuccess(friends: friends));
          }
        }
      });
    } catch (e) {
      emit(GetFriendsFailure(errorMessage: e.toString()));
      debugPrint('error from get friends cubit: ${e.toString()}');
    }
  }
}
