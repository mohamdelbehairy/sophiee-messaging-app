import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'follower_notification_state.dart';

class NotificationFollowerCubit extends Cubit<NotificationFollowerState> {
  NotificationFollowerCubit() : super(NotificationFollowerInitial());

  // init follower notification
  void initFolloweNotification() {
    FirebaseMessaging.onMessage.listen((event) {});
  }

  // send follower notification

  Future<void> sendFollowerNotification() async {}
}
