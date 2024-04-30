part of 'upload_audio_cubit.dart';

@immutable
sealed class UploadAudioState {}

final class UploadAudioInitial extends UploadAudioState {}

final class UploadAudioLoading extends UploadAudioState {}

final class UploadAudioSuccess extends UploadAudioState {}

final class UploadAudioFailure extends UploadAudioState {
  final String errorMessage;

  UploadAudioFailure({required this.errorMessage});
}
