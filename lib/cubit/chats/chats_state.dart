abstract class ChatsState {}

final class ChatsInitial extends ChatsState {}

final class ChatsLoading extends ChatsState {}

final class ChatsSuccess extends ChatsState {
}

final class ChatsFailure extends ChatsState {
  final String errorMessage;

  ChatsFailure({required this.errorMessage});
}
