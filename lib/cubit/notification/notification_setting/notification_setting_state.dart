part of 'notification_setting_cubit.dart';


sealed class NotificationSettingState {}

final class NotificationSettingInitial extends NotificationSettingState {}

final class InitLocalNotificationSuccess extends NotificationSettingState {}

final class RequestPermissionsSuccess extends NotificationSettingState {}
