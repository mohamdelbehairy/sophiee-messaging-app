import 'dart:io';

abstract class PickVideoState {}

final class PickVideoInitial extends PickVideoState {}

final class PickVideoSuccess extends PickVideoState {
  final File video;
  PickVideoSuccess({required this.video});
}

final class PickVideoFailure extends PickVideoState {
  final String errorMessage;

  PickVideoFailure({required this.errorMessage});
}
