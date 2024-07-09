import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/search/recent_search/recent_search_cubit.dart';
import 'recent_search_item.dart';

class RecentSearchListView extends StatelessWidget {
  const RecentSearchListView({super.key, required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    var getRecentSearch = context.read<RecentSearchCubit>();
    return Column(
      children: getRecentSearch.recentSearchList
          .map((e) => RecentSearchItem(isDark: isDark, recentSearchModel: e))
          .toList()
    );
  }
}
