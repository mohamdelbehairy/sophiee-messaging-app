import 'package:sophiee/models/users_model.dart';

final class GetUserDataStates {}

final class GetUserDataInitial extends GetUserDataStates {}

final class GetUserDataLoading extends GetUserDataStates {}

final class GetUserDataSuccess extends GetUserDataStates {
  final List<UserModel> userModel;

  GetUserDataSuccess({required this.userModel});
}

final class GetUserDataFailure extends GetUserDataStates {
  final String errorMessage;

  GetUserDataFailure({required this.errorMessage});
}
