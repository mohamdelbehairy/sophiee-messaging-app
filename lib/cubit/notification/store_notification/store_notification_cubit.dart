import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/models/notification_model.dart';
import 'package:uuid/uuid.dart';

import '../../../constants.dart';

part 'store_notification_state.dart';

class StoreNotificationCubit extends Cubit<StoreNotificationState> {
  StoreNotificationCubit() : super(StoreNotificationInitial());

  Future<void> storeNotification(
      {required String userID,
      required String notificationType,
      String? notificationID,
      bool? isLive}) async {
    emit(StoreNotificationLoading());
    try {
      NotificationModel notificationModel = NotificationModel.fromJson({
        'publishID': FirebaseAuth.instance.currentUser!.uid,
        'notificationType': notificationType,
        'notificationID': notificationID ?? const Uuid().v4(),
        'isLive': isLive,
        'isRead': false,
        'dateTime': Timestamp.now()
      });
      await FirebaseFirestore.instance
          .collection(notificationCollection)
          .doc(userID)
          .collection(notificationCollection)
          .doc(notificationModel.notificationID)
          .set(notificationModel.toJson());
      emit(StoreNotificationSuccess());
    } catch (e) {
      emit(StoreNotificationFailure(errorMessage: e.toString()));
      debugPrint('error from store notification method: $e');
    }
  }

  Future<void> updateIsLive(
      {required String userID, required String notificationID}) async {
    await FirebaseFirestore.instance
        .collection(notificationCollection)
        .doc(userID)
        .collection(notificationCollection)
        .doc(notificationID)
        .update({'isLive': null});
  }
}
