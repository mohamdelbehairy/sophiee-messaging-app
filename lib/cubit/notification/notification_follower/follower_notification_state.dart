part of 'follower_notification_cubit.dart';


sealed class NotificationFollowerState {}

final class NotificationFollowerInitial extends NotificationFollowerState {}

final class InitFollowerNotificationSuccess extends NotificationFollowerState {}

final class SendFollowerNotificationSuccess extends NotificationFollowerState {}

final class ShowFollowerNotificationSuccess extends NotificationFollowerState {}
