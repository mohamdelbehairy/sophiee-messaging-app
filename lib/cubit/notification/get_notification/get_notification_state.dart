part of 'get_notification_cubit.dart';

sealed class GetNotificationState {}

final class GetNotificationInitial extends GetNotificationState {}

final class GetNotificationLoading extends GetNotificationState {}

final class GetNotificationSuccess extends GetNotificationState {}

final class GetNotificationFailure extends GetNotificationState {
  final String errorMessage;

  GetNotificationFailure({required this.errorMessage});
}
