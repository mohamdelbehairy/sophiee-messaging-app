part of 'google_auth_cubit.dart';

sealed class GoogleAuthState {}

final class GoogleAuthInitial extends GoogleAuthState {}

final class GoogleAuthLoading extends GoogleAuthState {}

final class GoogleAuthSuccess extends GoogleAuthState {
  final bool isLoading;

  GoogleAuthSuccess({required this.isLoading});
}

final class GoogleAuthFailure extends GoogleAuthState {
  final String errorMessage;

  GoogleAuthFailure({required this.errorMessage});
}
