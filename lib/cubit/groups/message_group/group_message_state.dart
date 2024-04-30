abstract class GroupMessageState {}

final class GroupMessageInitial extends GroupMessageState {}

final class SendMessageGroupSuccess extends GroupMessageState {}

final class SendMessageGroupFailure extends GroupMessageState {
  final String errorMessage;

  SendMessageGroupFailure({required this.errorMessage});
}
final class GetMessageGroupsLoading extends GroupMessageState {}

final class GetMessageGroupsSuccess extends GroupMessageState {}

final class GetMessageGroupFailure extends GroupMessageState {
  final String errorMessage;

  GetMessageGroupFailure({required this.errorMessage});
}
