import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;

import '../../cubit/follow_status/follow_status_cubit.dart';
import '../../cubit/search/recent_search/recent_search_cubit.dart';
import '../../models/users_model.dart';
import '../../pages/search_result_page.dart';
import 'result_item/result_item.dart';

class ListViewResultFound extends StatelessWidget {
  const ListViewResultFound(
      {super.key, required this.searchList, required this.controller});
  final List<UserModel> searchList;
  final TextEditingController controller;

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
                // context.read<GetFollowingCubit>().getFollowing(
                //     userID: searchList[index].userID);
                // context.read<GetFollowersCubit>().getFollowers(
                //     userID: searchList[index].userID);

                getnav.Get.to(
                    () => SearchResultPage(userID: searchList[index].userID),
                    transition: getnav.Transition.rightToLeft);

                String userID = searchList[index].userID;
                bool isStore = storeRecentSearch.recentSearchList
                    .any((element) => element.userID == userID);

                if (!isStore) {
                  await storeRecentSearch.storeRecentSearch(
                      userID: searchList[index].userID);
                }
              },
              child: ResultIem(user: searchList[index]));
        });
  }
}
