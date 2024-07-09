import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';

part 'delete_recent_search_state.dart';

class DeleteRecentSearchCubit extends Cubit<DeleteRecentSearchState> {
  DeleteRecentSearchCubit() : super(DeleteRecentSearchInitial());

  Future<void> deleteRecentSearch() async {
    emit(DeleteRecentSearchLoading());
    try {
      var document = await FirebaseFirestore.instance
          .collection(recentSearchCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(recentSearchCollection)
          .get();

      for (QueryDocumentSnapshot snapshot in document.docs) {
        snapshot.reference.delete();
      }
      emit(DeleteRecentSearchSuccess());
    } catch (e) {
      emit(DeleteRecentSearchFailure(errorMessage: e.toString()));
      debugPrint('error from delete recent search method: $e');
    }
  }
}
