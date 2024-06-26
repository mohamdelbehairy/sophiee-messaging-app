import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/users_model.dart';
import '../../utils/widget/no_result_found.dart';
import 'list_view_result_found.dart';
import 'no_search_friend.dart';

class SearchPageResult extends StatelessWidget {
  const SearchPageResult(
      {super.key,
      required this.searchList,
      required this.list,
      required this.controller});

  final List<UserModel> searchList, list;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: searchList.isNotEmpty
          ? ListViewResultFound(searchList: searchList)
          : list
                  .where((element) => (element.emailAddress
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
                      "You didn't find any results with this name yet,\nplease enter a success username or email.",
                )
              : const NoSearchFriend(),
    );
  }
}
