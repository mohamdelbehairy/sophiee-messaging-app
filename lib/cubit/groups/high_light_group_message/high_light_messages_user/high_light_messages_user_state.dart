part of 'high_light_messages_user_cubit.dart';

@immutable
sealed class HighLightMessagesState {}

final class HighLightMessagesInitial extends HighLightMessagesState {}

final class HighLightMessagesUserLoading extends HighLightMessagesState {}

final class StoreHighLightMessageUserSuccess extends HighLightMessagesState {}

final class RemoveHighLightMessagesSuccess extends HighLightMessagesState {}

final class StoreHighLightMessageUserFailure extends HighLightMessagesState {
  final String errorMessage;

  StoreHighLightMessageUserFailure({required this.errorMessage});
}

final class RemoveHighLightMessagesFailure extends HighLightMessagesState {
  final String errorMessage;

  RemoveHighLightMessagesFailure({required this.errorMessage});
}
