import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;

import '../../cubit/follow_status/follow_status_cubit.dart';
import '../../models/users_model.dart';
import '../../pages/search_result_page.dart';
import 'result_item/result_item.dart';

class ListViewResultFound extends StatelessWidget {
  const ListViewResultFound({super.key, required this.searchList});
  final List<UserModel> searchList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: searchList.length,
        padding: const EdgeInsets.only(top: 16),
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                context
                    .read<FollowStatusCubit>()
                    .checkFollowStatus(followerID: searchList[index].userID);
                // context.read<GetFollowingCubit>().getFollowing(
                //     userID: searchList[index].userID);
                // context.read<GetFollowersCubit>().getFollowers(
                //     userID: searchList[index].userID);

                getnav.Get.to(() => SearchResultPage(user: searchList[index]),
                    transition: getnav.Transition.rightToLeft);
              },
              child: ResultIem(user: searchList[index]));
        });
  }
}
