import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/models/block_model.dart';

import '../../constants.dart';

part 'block_state.dart';

class BlockCubit extends Cubit<BlockState> {
  BlockCubit() : super(BlockInitial());

  Future<void> storeBlock({required String userID}) async {
    emit(BlockLoading());
    try {
      BlockModel blockModel = BlockModel.fromJson({
        'userID': userID,
        'dateTime': Timestamp.now(),
      });
      await FirebaseFirestore.instance
          .collection(blockingCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(blockingCollection)
          .doc(userID)
          .set(blockModel.toMap());
      emit(StoreBlockSuccess());
    } catch (e) {
      emit(BlockFailure(errorMessage: e.toString()));
      debugPrint('error from block method: $e');
    }
  }

  List<BlockModel> blockList = [];
  void getBlock() {
    FirebaseFirestore.instance
        .collection(blockingCollection)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(blockingCollection)
        .snapshots()
        .listen((snapshot) {
      blockList = [];
      for (var element in snapshot.docs) {
        blockList.add(BlockModel.fromJson(element.data()));
      }
      emit(GetBlockSuccess());
    });
  }

  Future<void> deleteBlock({required String userID}) async {
    await FirebaseFirestore.instance
        .collection(blockingCollection)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(blockingCollection)
        .doc(userID)
        .delete();
    emit(DeleteBlockSuccess());
  }
}
