part of 'delete_account_cubit.dart';

sealed class DeleteAccountState {}

final class DeleteAccountInitial extends DeleteAccountState {}

final class DeleteAccountLoading extends DeleteAccountState {}

final class DeleteFollowersAndFollowing extends DeleteAccountState {}

final class DeleteAccountFailure extends DeleteAccountState {
  final String errorMessage;

  DeleteAccountFailure({required this.errorMessage});
}
