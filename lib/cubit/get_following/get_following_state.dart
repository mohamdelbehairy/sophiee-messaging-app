
final class GetFollowingState {}

final class GetFollowingInitial extends GetFollowingState {}

final class GetFollowingLoading extends GetFollowingState {}

final class GetFollowingSuccess extends GetFollowingState {
  // final int numberOfFollowing;

  // GetFollowingSuccess({required this.numberOfFollowing});
}

final class GetFollowingFailure extends GetFollowingState {
  final String errorMessage;

  GetFollowingFailure({required this.errorMessage});
}

