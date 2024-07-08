import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'recent_search_state.dart';

class RecentSearchCubit extends Cubit<RecentSearchState> {
  RecentSearchCubit() : super(RecentSearchInitial());

  Future<void> storeRecentSearch({required String resentSearch}) async {
    emit(RecentSearchLoaing());
    try {
      await FirebaseFirestore.instance
          .collection('recentSearch')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('recentSearch')
          .doc()
          .set({'resentSearch': resentSearch});
      emit(StoreRecentSearchSuccess());
    } catch (e) {
      emit(RecentSearchFailure(errorMessage: e.toString()));
      debugPrint('error from store recent search method: $e');
    }
  }
}
