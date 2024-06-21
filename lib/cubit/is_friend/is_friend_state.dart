part of 'is_friend_cubit.dart';

sealed class IsFriendState {}

final class IsFriendInitial extends IsFriendState {}

final class IsFriendLoading extends IsFriendState {}

final class IsFriendSuccess extends IsFriendState {}

final class IsFriendFailure extends IsFriendState {
  final String errorMessage;

  IsFriendFailure({required this.errorMessage});
}
