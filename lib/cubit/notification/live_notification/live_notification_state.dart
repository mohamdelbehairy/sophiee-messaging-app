part of 'live_notification_cubit.dart';

sealed class LiveNotificationState {}

final class LiveNotificationInitial extends LiveNotificationState {}

final class SendLiveNotificationSuccess extends LiveNotificationState {}

final class ShowLiveNotificationSuccess extends LiveNotificationState {}

final class LiveNotificationFailure extends LiveNotificationState {
  final String errorMessage;

  LiveNotificationFailure({required this.errorMessage});
}
