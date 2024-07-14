part of 'block_cubit.dart';

sealed class BlockState {}

final class BlockInitial extends BlockState {}

final class BlockLoading extends BlockState {}

final class StoreBlockSuccess extends BlockState {}

final class GetBlockSuccess extends BlockState {}

final class DeleteBlockSuccess extends BlockState {}

final class BlockFailure extends BlockState {
  final String errorMessage;

  BlockFailure({required this.errorMessage});
}
