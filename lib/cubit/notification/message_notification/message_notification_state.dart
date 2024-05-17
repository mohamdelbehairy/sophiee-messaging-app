part of 'message_notification_cubit.dart';

sealed class MessageNotificationState {}

final class MessageNotificationInitial extends MessageNotificationState {}

final class InitMessageNotificationSuccess extends MessageNotificationState {}

final class SendMessageNotificationSuccess extends MessageNotificationState {}

final class ShowMessageNotificationSuccess extends MessageNotificationState {}

final class MessageNotificationFailure extends MessageNotificationState {
  final String errorMessage;

  MessageNotificationFailure({required this.errorMessage});
}
