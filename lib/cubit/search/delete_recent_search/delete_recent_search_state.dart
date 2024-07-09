part of 'delete_recent_search_cubit.dart';

sealed class DeleteRecentSearchState {}

final class DeleteRecentSearchInitial extends DeleteRecentSearchState {}

final class DeleteRecentSearchLoading extends DeleteRecentSearchState {}

final class DeleteRecentSearchSuccess extends DeleteRecentSearchState {}

final class DeleteRecentSearchFailure extends DeleteRecentSearchState {
  final String errorMessage;

  DeleteRecentSearchFailure({required this.errorMessage});
}
