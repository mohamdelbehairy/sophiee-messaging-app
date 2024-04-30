part of 'update_groups_details_cubit.dart';

@immutable
sealed class UpdateGroupsDetailsState {}

final class UpdateGroupsDetailsInitial extends UpdateGroupsDetailsState {}

final class UpdateGroupsDetailsLoading extends UpdateGroupsDetailsState {}

final class UpdateGroupsInfoSuccess extends UpdateGroupsDetailsState {}

final class UpdateGroupsDetailsFailure extends UpdateGroupsDetailsState {
  final String errorMessage;

  UpdateGroupsDetailsFailure({required this.errorMessage});
}

final class UpdateGroupsImageSuccess extends UpdateGroupsDetailsState {}

final class UpdateGroupsImageLoading extends UpdateGroupsDetailsState {
  final bool isLoading;

  UpdateGroupsImageLoading({required this.isLoading});
}

final class UploadGroupImageEditingSuccess extends UpdateGroupsDetailsState {}

final class UploadGroupImageEditingFailure extends UpdateGroupsDetailsState {
  final String errorMessage;

  UploadGroupImageEditingFailure({required this.errorMessage});
}
