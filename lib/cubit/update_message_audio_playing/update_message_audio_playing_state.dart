part of 'update_message_audio_playing_cubit.dart';

@immutable
sealed class UpdateMessageAudioPlayingState {}

final class UpdateMessageAudioPlayingInitial
    extends UpdateMessageAudioPlayingState {}

final class UpdateMessageAudioPlayingLoading
    extends UpdateMessageAudioPlayingState {}

final class UpdateChatMessageAudioPlayingSuccess
    extends UpdateMessageAudioPlayingState {}

    final class UpdateGroupMessageAudioPlayingSuccess
    extends UpdateMessageAudioPlayingState {}

final class UpdateMessageAudioPlayingFailure
    extends UpdateMessageAudioPlayingState {
  final String errroMessage;

  UpdateMessageAudioPlayingFailure({required this.errroMessage});
}
