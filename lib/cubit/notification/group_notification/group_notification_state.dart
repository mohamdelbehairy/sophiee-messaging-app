part of 'group_notification_cubit.dart';

sealed class GroupNotificationState {}

final class GroupNotificationInitial extends GroupNotificationState {}

final class SendGroupNotificationSuccess extends GroupNotificationState {}

final class ShowGroupNotificationSuccess extends GroupNotificationState {}

final class GroupNotificationFailure extends GroupNotificationState {
  final String errorMessage;

  GroupNotificationFailure({required this.errorMessage});
}
