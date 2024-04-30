part of 'update_chat_high_light_cubit.dart';

@immutable
sealed class UpdateChatHighLightState {}

final class UpdateChatHighLightInitial extends UpdateChatHighLightState {}

final class UpdateChatHighLightLoading extends UpdateChatHighLightState {}

final class UpdateChatHighLightSuccess extends UpdateChatHighLightState {}

final class UpdateChatHighLightFailure extends UpdateChatHighLightState {
  final String errorMessage;

  UpdateChatHighLightFailure({required this.errorMessage});
}
