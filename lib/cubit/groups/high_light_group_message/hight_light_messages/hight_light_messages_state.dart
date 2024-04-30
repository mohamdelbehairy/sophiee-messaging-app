part of 'high_light_messages_cubit.dart';

@immutable
sealed class HightLightMessagesState {}

final class HightLightMessagesInitial extends HightLightMessagesState {}

final class HightLightMessagesLoading extends HightLightMessagesState {}

final class StoreHightLightMessagesSuccess extends HightLightMessagesState {}

final class RemoveHightLightMessagesSuccess extends HightLightMessagesState {}

final class RemoveAllHightLightMessagesSuccess extends HightLightMessagesState {}

final class GetHightLightMessagesSuccess extends HightLightMessagesState {}

final class StoreHightLightMessagesFailure extends HightLightMessagesState {
  final String errorMessage;

  StoreHightLightMessagesFailure({required this.errorMessage});
}

final class RemoveStoreHightLightMessagesFailure
    extends HightLightMessagesState {
  final String errorMessage;

  RemoveStoreHightLightMessagesFailure({required this.errorMessage});
}

final class GetHightLightMessagesFailure extends HightLightMessagesState {
  final String errorMessage;

  GetHightLightMessagesFailure({required this.errorMessage});
}
