import 'package:flutter/material.dart';
import '../../cubit/search/recent_search/recent_search_cubit.dart';
import 'recent_search_list_view.dart';
import 'search_page_header.dart';

class SearchPageRecentSearch extends StatelessWidget {
  const SearchPageRecentSearch(
      {super.key,
      required this.isDark,
      required this.size,
      required this.controller,
      required this.getRecentSearch});

  final bool isDark;
  final Size size;
  final TextEditingController controller;
  final RecentSearchCubit getRecentSearch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: Column(
        children: [
          if (getRecentSearch.recentSearchList.isNotEmpty)
            SearchPageHeader(
                isDark: isDark, size: size, controller: controller),
          if (controller.text.isEmpty) RecentSearchListView(isDark: isDark),
        ],
      ),
    );
  }
}
