abstract class MessageState {}

final class MessageInitial extends MessageState {}
final class MessageLoading extends MessageState {}

final class SendMessageSuccess extends MessageState {}

final class SendMessageFailure extends MessageState {
  final String errorMessage;

  SendMessageFailure({required this.errorMessage});
}

final class GetMessageSuccess extends MessageState {}

final class GetMessageFailure extends MessageState {
  final String errorMessage;

  GetMessageFailure({required this.errorMessage});
}

final class DeleteMessageSuccess extends MessageState {}

final class DeleteChatSuccess extends MessageState {}

final class TypingSuccess extends MessageState {
  final bool isTyping;

  TypingSuccess({required this.isTyping});
}
