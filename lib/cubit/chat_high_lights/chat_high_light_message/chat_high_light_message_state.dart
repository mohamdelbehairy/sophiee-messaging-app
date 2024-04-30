part of 'chat_high_light_message_cubit.dart';

@immutable
sealed class ChatHighLightMessageState {}

final class ChatHighLightMessageInitial extends ChatHighLightMessageState {}

final class ChatHighLightMessageLoading extends ChatHighLightMessageState {}

final class ChatStoreHighLightMessageSuccess
    extends ChatHighLightMessageState {}

final class ChatRemoveHighLightMessageSuccess
    extends ChatHighLightMessageState {}

final class ChatRemoveAllHighLightMessageSuccess
    extends ChatHighLightMessageState {}

final class ChatUpdateAllHighLightMessageSuccess
    extends ChatHighLightMessageState {}

final class ChatGetHighLightMessageSuccess extends ChatHighLightMessageState {}

final class ChatHighLightMessageFailure extends ChatHighLightMessageState {
  final String errorMessage;

  ChatHighLightMessageFailure({required this.errorMessage});
}
