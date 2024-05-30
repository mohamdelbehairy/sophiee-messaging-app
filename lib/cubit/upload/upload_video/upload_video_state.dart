part of 'upload_video_cubit.dart';

@immutable
sealed class UploadVideoState {}

final class UploadVideoInitial extends UploadVideoState {}

final class UploadVideoLoading extends UploadVideoState {
  final bool isLoading;

  UploadVideoLoading({required this.isLoading});
}

final class UploadVideoSuccess extends UploadVideoState {}

final class UploadVideoFailure extends UploadVideoState {
  final String errorMessage;

  UploadVideoFailure({required this.errorMessage});
}
