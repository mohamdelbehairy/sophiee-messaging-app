part of 'delete_image_cubit.dart';

sealed class DeleteImageState {}

final class DeleteImageInitial extends DeleteImageState {}

final class DeleteImageSuccess extends DeleteImageState {}

final class DeleteImageFailure extends DeleteImageState {
  final String errorMessage;

  DeleteImageFailure({required this.errorMessage});
}
