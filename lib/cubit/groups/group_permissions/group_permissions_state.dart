part of 'group_permissions_cubit.dart';

@immutable
sealed class GroupPermissionsState {}

final class GroupPermissionsInitial extends GroupPermissionsState {}

final class GroupPermissionsUpdatedLoading extends GroupPermissionsState {}

final class GroupPermissionsUpdatedSuccess extends GroupPermissionsState {}

final class GroupPermissionsUpdatedFailure extends GroupPermissionsState {
  final String errorMessage;

  GroupPermissionsUpdatedFailure({required this.errorMessage});
}
