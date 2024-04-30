import 'package:sophiee/models/group_model.dart';

abstract class GetGroupsMemberState {}

final class GetGroupsMemberInitial extends GetGroupsMemberState {}

final class GetGroupsMemberLoading extends GetGroupsMemberState {}

final class GetGroupsMemberSuccess extends GetGroupsMemberState {
  final List<GroupModel> groupsList;

  GetGroupsMemberSuccess({required this.groupsList});
}

final class GetGroupsMemberFailure extends GetGroupsMemberState {
  final String errorMessage;

  GetGroupsMemberFailure({required this.errorMessage});
}
