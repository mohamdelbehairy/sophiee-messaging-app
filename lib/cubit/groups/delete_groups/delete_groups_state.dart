part of 'delete_groups_cubit.dart';

@immutable
sealed class DeleteGroupsState {}

final class DeleteGroupsInitial extends DeleteGroupsState {}

final class DeleteGroupsLoading extends DeleteGroupsState {}

final class DeleteGroupsSuccessOwner extends DeleteGroupsState {}

final class LeaveGroupsSuccessMember extends DeleteGroupsState {}

final class DeleteGroupsFailure extends DeleteGroupsState {
  final String errorMessage;

  DeleteGroupsFailure({required this.errorMessage});
}
