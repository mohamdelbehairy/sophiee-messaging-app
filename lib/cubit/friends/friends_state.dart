final class FriendsState {}

final class SetFriendsInitial extends FriendsState {}

final class SetFriendsLoading extends FriendsState {}

final class SetFriendsSuccess extends FriendsState {}

final class SetFriendsFailure extends FriendsState {
  final String errorMessage;

  SetFriendsFailure({required this.errorMessage});
}

final class DeleteFriendsSuccess extends FriendsState {}
