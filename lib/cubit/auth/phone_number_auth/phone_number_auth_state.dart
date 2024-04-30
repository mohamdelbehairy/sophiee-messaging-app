part of 'phone_number_auth_cubit.dart';

@immutable
sealed class PhoneNumberAuthState {}

final class PhoneNumberAuthInitial extends PhoneNumberAuthState {}

final class PhoneNumberAuthLoading extends PhoneNumberAuthState {
  final bool isLoading;

  PhoneNumberAuthLoading({required this.isLoading});
}

final class SendPhoneNumberAuthSuccess extends PhoneNumberAuthState {}

final class SendPhoneNumberAuthFailure extends PhoneNumberAuthState {
  final String errorMessage;

  SendPhoneNumberAuthFailure({required this.errorMessage});
}
final class VerificationCompleted extends PhoneNumberAuthState {}

final class VerifyPhoneNumberAuthSuccess extends PhoneNumberAuthState {}

final class VerifyPhoneNumberAuthFailure extends PhoneNumberAuthState {
  final String errorMessage;

  VerifyPhoneNumberAuthFailure({required this.errorMessage});
}
