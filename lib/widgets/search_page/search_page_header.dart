import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/constants.dart';

import '../../cubit/search/delete_recent_search/delete_recent_search_cubit.dart';
import '../../utils/custom_show_dialog.dart';

class SearchPageHeader extends StatelessWidget {
  const SearchPageHeader(
      {super.key,
      required this.isDark,
      required this.size,
      required this.controller});

  final bool isDark;
  final Size size;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    var deleteRecentSearch = context.read<DeleteRecentSearchCubit>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Recent Search',
            style: TextStyle(
                color: isDark ? Colors.white : const Color(0xffb0afb4),
                fontSize: size.width * .04)),
        if (controller.text.isEmpty)
          GestureDetector(
            onTap: () => customShowDialog(
              title: 'Clear search history',
              contentText: 'Do you want to clear your search history?',
              context: context,
              backgroundColor: kPrimaryColor,
              okFunction: () async {
                Navigator.pop(context);
                await deleteRecentSearch.deleteRecentSearch();
              },
              doneButtonText: 'Clear All',
            ),
            child: Text('Clear History',
                style:
                    TextStyle(color: Colors.blue, fontSize: size.width * .04)),
          ),
      ],
    );
  }
}
