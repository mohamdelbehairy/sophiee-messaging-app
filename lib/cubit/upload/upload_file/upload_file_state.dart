part of 'upload_file_cubit.dart';

@immutable
sealed class UploadFileState {}

final class UploadFileInitial extends UploadFileState {}

final class UploadFileLoading extends UploadFileState {}

final class UploadFileSuccess extends UploadFileState {}

final class UploadFileFailure extends UploadFileState {
  final String errorMessage;

  UploadFileFailure({required this.errorMessage});
}
