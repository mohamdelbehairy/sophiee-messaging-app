part of 'user_token_cubit.dart';

sealed class UserTokenState {}

final class UserTokenInitial extends UserTokenState {}

final class GetTokenSuccess extends UserTokenState {}


final class UpdateTokenSuccess extends UserTokenState {}

final class UserTokenFailure extends UserTokenState {
  final String errorMessage;

  UserTokenFailure({required this.errorMessage});
}
