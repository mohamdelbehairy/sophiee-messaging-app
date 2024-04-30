import 'dart:io';

final class PickImageStates {}

final class PickImageInitial extends PickImageStates {}

final class PickImageLoading extends PickImageStates {}

final class PickImageSucccess extends PickImageStates {
  final File image;

  PickImageSucccess({required this.image});
}

final class PickImageFailure extends PickImageStates {
  final String errorMessage;

  PickImageFailure({required this.errorMessage});
}
