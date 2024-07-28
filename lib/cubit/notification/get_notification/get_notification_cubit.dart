import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/constants.dart';

import '../../../models/notification_model.dart';

part 'get_notification_state.dart';

class GetNotificationCubit extends Cubit<GetNotificationState> {
  GetNotificationCubit() : super(GetNotificationInitial());

  List<NotificationModel> notification = [];
  void getNotification() {
    emit(GetNotificationLoading());
    try {
      FirebaseFirestore.instance
          .collection(notificationCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(notificationCollection)
          .orderBy('dateTime', descending: true)
          .snapshots()
          .listen((snapshot) {
        notification = [];
        for (var element in snapshot.docs) {
          notification.add(NotificationModel.fromJson(element.data()));
        }
        log('notification: ${notification.length}');
        emit(GetNotificationSuccess());
      });
    } catch (e) {
      emit(GetNotificationFailure(errorMessage: e.toString()));
      debugPrint('error from get notification method: $e');
    }
  }
}
