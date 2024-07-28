part of 'store_notification_cubit.dart';

sealed class StoreNotificationState {}

final class StoreNotificationInitial extends StoreNotificationState {}

final class StoreNotificationLoading extends StoreNotificationState {}

final class StoreGetNotificationSuccess extends StoreNotificationState {}

final class StoreGetNotificationFailure extends StoreNotificationState {
  final String errorMessage;

  StoreGetNotificationFailure({required this.errorMessage});
}
