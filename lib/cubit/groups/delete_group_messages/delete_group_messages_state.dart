part of 'delete_group_messages_cubit.dart';

@immutable
sealed class DeleteGroupMessagesState {}

final class DeleteGroupMessagesInitial extends DeleteGroupMessagesState {}

final class DeleteGroupMessagesLoading extends DeleteGroupMessagesState {}

final class DeleteGroupMessagesSuccess extends DeleteGroupMessagesState {}

final class DeleteGroupMediaFilesSuccess extends DeleteGroupMessagesState {}

final class DeleteGroupMessagesFailure extends DeleteGroupMessagesState {
  final String errorMessage;

  DeleteGroupMessagesFailure({required this.errorMessage});
}

final class DeleteGroupMediaFilesFailure extends DeleteGroupMessagesState {
  final String errorMessage;

  DeleteGroupMediaFilesFailure({required this.errorMessage});
}
