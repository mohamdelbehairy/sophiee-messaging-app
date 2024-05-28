class UpdateUserDataStates {}

class UpdateUserDataInitial extends UpdateUserDataStates {}

class UpdateUserDataLoading extends UpdateUserDataStates {
  final bool isLoading;

  UpdateUserDataLoading({required this.isLoading});
}

class UpdateUserDataSuccess extends UpdateUserDataStates {}

class UpdateUserFailure extends UpdateUserDataStates {
  final String errorMessage;

  UpdateUserFailure({required this.errorMessage});
}

class MuteUserSuccess extends UpdateUserDataStates {}

class UnMuteUserSuccess extends UpdateUserDataStates {}
