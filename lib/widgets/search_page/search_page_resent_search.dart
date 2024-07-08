import 'package:flutter/material.dart';
import 'resent_search_item.dart';
import 'search_page_header.dart';

class SearchPageResentSearch extends StatelessWidget {
  const SearchPageResentSearch(
      {super.key, required this.isDark, required this.size});

  final bool isDark;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: Column(
        children: [
          SearchPageHeader(isDark: isDark, size: size),
          ResentSearchItem(isDark: isDark),
        ],
      ),
    );
  }
}
