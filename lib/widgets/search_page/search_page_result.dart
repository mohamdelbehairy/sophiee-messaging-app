import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../cubit/search/recent_search/recent_search_cubit.dart';
import '../../models/users_model.dart';
import '../../utils/widget/no_result_found.dart';
import 'list_view_result_found.dart';
import 'no_search_friend.dart';

class SearchPageResult extends StatelessWidget {
  const SearchPageResult(
      {super.key,
      required this.searchList,
      required this.list,
      required this.controller, required this.userData});

  final List<UserModel> searchList, list;
  final TextEditingController controller;
    final UserModel userData;

  @override
  Widget build(BuildContext context) {
    var getRecentSearch = context.read<RecentSearchCubit>();

    return Expanded(
      child: searchList.isNotEmpty
          ? ListViewResultFound(searchList: searchList, controller: controller,userData: userData)
          : list
                  .where((element) => (element.emailAddress
                          .toLowerCase()
                          .contains(controller.text.toLowerCase()) ||
                      element.nickName
                          .toLowerCase()
                          .contains(controller.text.toLowerCase()) ||
                      element.userName
                          .toLowerCase()
                          .contains(controller.text.toLowerCase())))
                  .toList()
                  .isEmpty
              ? const CustomNoResultFound(
                  image: emptyImageUrl,
                  textOne: 'No Result Found',
                  textTwo:
                      "You didn't find any results with this name yet,\nplease enter a success username or email.")
              : getRecentSearch.recentSearchList.isNotEmpty
                  ? const SizedBox()
                  : const NoSearchFriend(),
    );
  }
}
