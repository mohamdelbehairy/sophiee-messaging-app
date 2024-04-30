abstract class CreateGroupsState {}

final class CreateGroupsInitial extends CreateGroupsState {}

final class UploadGroupImageLoading extends CreateGroupsState {
  final bool isLoading;

  UploadGroupImageLoading({required this.isLoading});
}

final class CreateGroupsSuccess extends CreateGroupsState {}

final class CreateGroupsFailure extends CreateGroupsState {
  final String errorMessage;

  CreateGroupsFailure({required this.errorMessage});
}

final class GetGroupSuccess extends CreateGroupsState {}

final class GetGroupFailure extends CreateGroupsState {
  final String errorMessage;

  GetGroupFailure({required this.errorMessage});
}

final class UploadGroupImageSuccess extends CreateGroupsState {}

final class UploadGroupImageFailure extends CreateGroupsState {
  final String errorMessage;

  UploadGroupImageFailure({required this.errorMessage});
}
