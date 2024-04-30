final class GetFollowersState {}

final class GetFollowersInitial extends GetFollowersState {}

final class GetFollowersLoading extends GetFollowersState {}

final class GetFollowersSuccess extends GetFollowersState {
  // final int numberOfFollowers;

  // GetFollowersSuccess({required this.numberOfFollowers});
}

final class GetFollowersFailure extends GetFollowersState {
  final String errorMessage;

  GetFollowersFailure({required this.errorMessage});
}
