part of 'store_notification_cubit.dart';

sealed class StoreNotificationState {}

final class StoreNotificationInitial extends StoreNotificationState {}

final class StoreNotificationLoading extends StoreNotificationState {}

final class StoreNotificationSuccess extends StoreNotificationState {}

final class StoreNotificationFailure extends StoreNotificationState {
  final String errorMessage;

  StoreNotificationFailure({required this.errorMessage});
}
