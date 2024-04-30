part of 'chat_get_media_files_cubit.dart';

@immutable
sealed class ChatGetMediaFilesState {}

final class ChatGetMediaFilesInitial extends ChatGetMediaFilesState {}

final class ChatGetMediaFilesLoading extends ChatGetMediaFilesState {}

final class ChatGetMediaSuccess extends ChatGetMediaFilesState {}

final class ChatGetFilesSuccess extends ChatGetMediaFilesState {}

final class ChatGetLinksSuccess extends ChatGetMediaFilesState {}

final class ChatGetVoiceSuccess extends ChatGetMediaFilesState {}

final class ChatGetMediaFilesFailure extends ChatGetMediaFilesState {
  final String errorMessage;

  ChatGetMediaFilesFailure({required this.errorMessage});
}
