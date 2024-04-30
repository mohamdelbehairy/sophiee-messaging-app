class UpdateUserDataStates {}

class UpdateUserDataInitial extends UpdateUserDataStates {}

class UpdateUserDataLoading extends UpdateUserDataStates {
  final bool isSelected;

  UpdateUserDataLoading({required this.isSelected});
}

class UpdateUserDataSuccess extends UpdateUserDataStates {}

class UpdateUserBioSuccess extends UpdateUserDataStates {}

class UpdateUserUserNameSuccess extends UpdateUserDataStates {}

class UpdateUserNickNameSuccess extends UpdateUserDataStates {}

class UpdateUserFailure extends UpdateUserDataStates {
  final String errorMessage;

  UpdateUserFailure({required this.errorMessage});
}

class UpdateProfileImageSuccess extends UpdateUserDataStates {}

class UpdateProfileImageFailure extends UpdateUserDataStates {
  final String errorMessage;

  UpdateProfileImageFailure({required this.errorMessage});
}
