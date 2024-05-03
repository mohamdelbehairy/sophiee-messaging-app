final class GetFollowersState {}

final class GetFollowersInitial extends GetFollowersState {}

final class GetFollowersLoading extends GetFollowersState {}

final class GetFollowersSuccess extends GetFollowersState {}

final class IsFollowersFoundSuccess extends GetFollowersState {}

final class GetFollowersFailure extends GetFollowersState {
  final String errorMessage;

  GetFollowersFailure({required this.errorMessage});
}
