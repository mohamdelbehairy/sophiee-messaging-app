import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/search/recent_search/recent_search_cubit.dart';
import '../../models/users_model.dart';
import 'search_page_app_bar.dart';
import 'search_page_recent_search.dart';
import 'search_page_result.dart';

class SearchPageDetails extends StatelessWidget {
  const SearchPageDetails(
      {super.key,
      required this.size,
      required this.controller,
      required this.isDark,
      required this.searchList,
      required this.list,
      required this.onTap,
      required this.onChanged});

  final Size size;
  final TextEditingController controller;
  final bool isDark;
  final List<UserModel> searchList, list;
  final Function() onTap;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    var getRecentSearch = context.read<RecentSearchCubit>();
    return BlocBuilder<RecentSearchCubit, RecentSearchState>(
      builder: (context, state) {
        return Column(
          children: [
            SearchPageAppBar(
                size: size,
                controller: controller,
                onTap: onTap,
                onChanged: onChanged),
            SearchPageRecentSearch(
                getRecentSearch: getRecentSearch,
                isDark: isDark,
                size: size,
                controller: controller),
            SearchPageResult(
                searchList: searchList, list: list, controller: controller),
          ],
        );
      },
    );
  }
}
