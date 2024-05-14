part of 'store_image_cubit.dart';


sealed class StoreImageState {}

final class StoreImageInitial extends StoreImageState {}

final class StoreImageLoading extends StoreImageState {}

final class StoreImageSuccess extends StoreImageState {}

final class StoreImageFailure extends StoreImageState {
  final String errorMessage;

  StoreImageFailure({required this.errorMessage});
}
