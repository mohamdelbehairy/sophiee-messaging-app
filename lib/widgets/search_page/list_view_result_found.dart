import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/utils/navigation.dart';

import '../../cubit/follow_status/follow_status_cubit.dart';
import '../../cubit/search/recent_search/recent_search_cubit.dart';
import '../../models/users_model.dart';
import '../../pages/search_result_page.dart';
import 'result_item/result_item.dart';

class ListViewResultFound extends StatelessWidget {
  const ListViewResultFound(
      {super.key,
      required this.searchList,
      required this.controller,
      required this.userData});
  final List<UserModel> searchList;
  final TextEditingController controller;
  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    var storeRecentSearch = context.read<RecentSearchCubit>();

    return ListView.builder(
        itemCount: searchList.length,
        padding: const EdgeInsets.only(top: 8),
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () async {
                context
                    .read<FollowStatusCubit>()
                    .checkFollowStatus(followerID: searchList[index].userID);

                Navigation.push(context,
                    SearchResultPage(userID: searchList[index].userID));

                String userID = searchList[index].userID;
                bool isStore = storeRecentSearch.recentSearchList
                    .any((element) => element.userID == userID);

                if (!isStore) {
                  await storeRecentSearch.storeRecentSearch(
                      userID: searchList[index].userID);
                }
              },
              child: ResultIem(user: searchList[index], userData: userData));
        });
  }
}
