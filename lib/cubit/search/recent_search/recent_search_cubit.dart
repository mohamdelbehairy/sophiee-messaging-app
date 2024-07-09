import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/models/recent_search_model.dart';

import '../../../constants.dart';

part 'recent_search_state.dart';

class RecentSearchCubit extends Cubit<RecentSearchState> {
  RecentSearchCubit() : super(RecentSearchInitial());

  Future<void> storeRecentSearch({
    required String userID,
  }) async {
    emit(RecentSearchLoaing());
    try {
      RecentSearchModel recentSearchModel = RecentSearchModel.fromJson(
          {'userID': userID, 'dateTime': Timestamp.now()});
      await FirebaseFirestore.instance
          .collection(recentSearchCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(recentSearchCollection)
          .doc(userID)
          .set(recentSearchModel.toMap());
      emit(StoreRecentSearchSuccess());
    } catch (e) {
      emit(RecentSearchFailure(errorMessage: e.toString()));
      debugPrint('error from store recent search method: $e');
    }
  }

  List<RecentSearchModel> recentSearchList = [];
  void getRecentSearch() {
    emit(RecentSearchLoaing());
    try {
      FirebaseFirestore.instance
          .collection(recentSearchCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(recentSearchCollection)
          .orderBy('dateTime', descending: true)
          .limit(3)
          .snapshots()
          .listen((event) {
        recentSearchList = [];
        for (var element in event.docs) {
          recentSearchList.add(RecentSearchModel.fromJson(element.data()));
        }
        emit(GstRecentSearchSuccess());
      });
    } catch (e) {
      emit(RecentSearchFailure(errorMessage: e.toString()));
      debugPrint('error from get recent search method: $e');
    }
  }
}
