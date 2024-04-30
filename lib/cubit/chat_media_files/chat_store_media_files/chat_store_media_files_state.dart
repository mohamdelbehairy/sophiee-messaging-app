part of 'chat_store_media_files_cubit.dart';

@immutable
sealed class ChatStoreMediaFilesState {}

final class ChatStoreMediaFilesInitial extends ChatStoreMediaFilesState {}

final class ChatStoreMediaFilesLoading extends ChatStoreMediaFilesState {}

final class ChatStoreMediaFilesStoreMediaSuccess
    extends ChatStoreMediaFilesState {}

final class ChatStoreMediaFilesStoreFilesSuccess
    extends ChatStoreMediaFilesState {}

final class ChatStoreMediaFilesStoreLinksSuccess
    extends ChatStoreMediaFilesState {}

final class ChatStoreMediaFilesStoreVoiceSuccess
    extends ChatStoreMediaFilesState {}

final class ChatStoreMediaFilessFailure extends ChatStoreMediaFilesState {
  final String errorMessage;

  ChatStoreMediaFilessFailure({required this.errorMessage});
}
