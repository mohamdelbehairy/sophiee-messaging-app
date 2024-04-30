part of 'groups_members_details_cubit.dart';

@immutable
sealed class GroupsMembersDetailsState {}

final class GroupsMembersDetailsInitial extends GroupsMembersDetailsState {}

final class RemoveMemebrLoading extends GroupsMembersDetailsState {}

final class RemoveMemberSuccess extends GroupsMembersDetailsState {}

final class RemoveMemberFailure extends GroupsMembersDetailsState {
  final String errorMessage;

  RemoveMemberFailure({required this.errorMessage});
}
final class AddMemebrLoading extends GroupsMembersDetailsState {}

final class AddMemberSuccess extends GroupsMembersDetailsState {}

final class AddMemberFailure extends GroupsMembersDetailsState {
  final String errorMessage;

  AddMemberFailure({required this.errorMessage});
}


final class MakeAdminSuccess extends GroupsMembersDetailsState {}

final class MakeAdminFailure extends GroupsMembersDetailsState {
  final String errorMessage;

  MakeAdminFailure({required this.errorMessage});
}


final class RemoveAdminSuccess extends GroupsMembersDetailsState {}

final class RemoveAdminFailure extends GroupsMembersDetailsState {
  final String errorMessage;

  RemoveAdminFailure({required this.errorMessage});
}
