import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UpdateUserOnline {
  static void checkOnline() async {
    Timer.periodic(const Duration(seconds: 10), (Timer t) async {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        log('connection online and good');
        var currentUser = FirebaseAuth.instance.currentUser;
        if (currentUser != null) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(currentUser.uid)
              .update({'onlineStatue': Timestamp.now()});
          // StoryCubit storyCubit = StoryCubit();
          // storyCubit.deleteStory();
        }
      }
    });
  }
}
