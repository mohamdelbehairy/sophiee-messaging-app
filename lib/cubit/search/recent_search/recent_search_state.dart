part of 'recent_search_cubit.dart';

sealed class RecentSearchState {}

final class RecentSearchInitial extends RecentSearchState {}

final class RecentSearchLoaing extends RecentSearchState {}

final class StoreRecentSearchSuccess extends RecentSearchState {}

final class RecentSearchFailure extends RecentSearchState {
  final String errorMessage;

  RecentSearchFailure({required this.errorMessage});
}
