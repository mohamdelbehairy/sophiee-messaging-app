import 'dart:io';

abstract class PickFileState {}

final class PickFileInital extends PickFileState {}

final class PickFileSuccess extends PickFileState {
  final File file;

  PickFileSuccess({required this.file});
}

final class PickFileFailure extends PickFileState {
  final String errorMessage;

  PickFileFailure({required this.errorMessage});
}
