part of 'follower_notification_cubit.dart';

sealed class FolloweNotificationState {}

final class FolloweNotificationInitial extends FolloweNotificationState {}

final class InitFollowerNotificationSuccess extends FolloweNotificationState {}

final class SendFollowerNotificationSuccess extends FolloweNotificationState {}

final class ShowFollowerNotificationSuccess extends FolloweNotificationState {}

final class FolloweNotificationFailure extends FolloweNotificationState {
  final String errorMessage;

  FolloweNotificationFailure({required this.errorMessage});
}
