part of 'store_user_date_cubit.dart';

@immutable
sealed class StoreUserDateState {}

final class StoreUserDateInitial extends StoreUserDateState {}

final class StoreUserDateLoading extends StoreUserDateState {
  final bool isLoading;

  StoreUserDateLoading({required this.isLoading});
}

final class StoreUserDateSuccess extends StoreUserDateState {}

final class StoreUserDateFailure extends StoreUserDateState {
  final String errorMessage;

  StoreUserDateFailure({required this.errorMessage});
}
