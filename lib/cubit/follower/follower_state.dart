final class FollowerState {}

final class AddFollowerInitial extends FollowerState {}

final class AddFollowerLoading extends FollowerState {}

final class AddFollowerSuccess extends FollowerState {
  final bool isFollowing;

  AddFollowerSuccess({required this.isFollowing});
}

final class AddFollowerFailure extends FollowerState {
  final String errorMessage;

  AddFollowerFailure({required this.errorMessage});
}

final class DeleteFollowerSuccess extends FollowerState {
  final bool isFollowing;

  DeleteFollowerSuccess({required this.isFollowing});
}

final class BlocAllFollowerInfoSuccess extends FollowerState {}
