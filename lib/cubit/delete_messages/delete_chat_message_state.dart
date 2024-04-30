part of 'delete_chat_message_cubit.dart';

@immutable
sealed class DeleteChatMessageState {}

final class DeleteChatMessageInitial extends DeleteChatMessageState {}

final class DeleteChatMessageLoading extends DeleteChatMessageState {}

final class DeleteChatMessageSuccess extends DeleteChatMessageState {}

final class DeleteChatMediaFilesSuccess extends DeleteChatMessageState {}

final class DeleteChatAllMediaFilesSuccess extends DeleteChatMessageState {}

final class DeleteChatMessageFailure extends DeleteChatMessageState {
  final String errorMessage;

  DeleteChatMessageFailure({required this.errorMessage});
}

final class DeleteChatMediaFilesFailure extends DeleteChatMessageState {
  final String errorMessage;

  DeleteChatMediaFilesFailure({required this.errorMessage});
}
