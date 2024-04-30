part of 'open_files_cubit.dart';

@immutable
sealed class OpenFilesState {}

final class OpenFilesInitial extends OpenFilesState {}

final class OpenFilesSuccess extends OpenFilesState {}

final class OpenFilesFailure extends OpenFilesState {
  final String errorMessage;

  OpenFilesFailure({required this.errorMessage});
}
