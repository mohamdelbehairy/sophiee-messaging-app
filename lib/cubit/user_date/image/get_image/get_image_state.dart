part of 'get_image_cubit.dart';


sealed class GetImageState {}

final class GetImageInitial extends GetImageState {}

final class GetImageLoading extends GetImageState {}

final class GetImageSuccess extends GetImageState {}

final class GetImageFailure extends GetImageState {
  final String errorMessage;

  GetImageFailure({required this.errorMessage});
}
