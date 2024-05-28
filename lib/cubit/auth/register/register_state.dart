part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {
  final bool isLoading;

  RegisterLoading({required this.isLoading});
}

final class RegisterSuccess extends RegisterState {}

final class RegisterFailure extends RegisterState {
  final String errorMessage;

  RegisterFailure({required this.errorMessage});
}

