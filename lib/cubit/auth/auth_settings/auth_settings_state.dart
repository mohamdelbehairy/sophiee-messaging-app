part of 'auth_settings_cubit.dart';

@immutable
sealed class AuthSettingsState {}

final class AuthSettingsInitial extends AuthSettingsState {}

final class AuthSettingsLoading extends AuthSettingsState {}

final class ResetPasswordSuccess extends AuthSettingsState {}

final class EmailSignOutSuccess extends AuthSettingsState {}

final class GoogleSignOutSuccess extends AuthSettingsState {}

final class FacebookSignOutSuccess extends AuthSettingsState {}

final class VerificationEmailSuccess extends AuthSettingsState {}

final class AuthSettingsFailure extends AuthSettingsState {
  final String errorMessage;

  AuthSettingsFailure({required this.errorMessage});
}
