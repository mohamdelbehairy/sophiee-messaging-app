import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/pages/search_result_page.dart';
import 'package:sophiee/utils/navigation.dart';

import '../../cubit/follow_status/follow_status_cubit.dart';
import '../../cubit/user_date/get_user_data/get_user_data_cubit.dart';
import '../../cubit/user_date/get_user_data/get_user_data_state.dart';
import '../../models/recent_search_model.dart';
import 'recent_search_image.dart';
import 'recent_search_texts.dart';

class RecentSearchItem extends StatelessWidget {
  const RecentSearchItem(
      {super.key, required this.isDark, required this.recentSearchModel});

  final bool isDark;
  final RecentSearchModel recentSearchModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: BlocBuilder<GetUserDataCubit, GetUserDataStates>(
        builder: (context, state) {
          if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
            final userData = state.userModel.firstWhere((element) =>
                element.userID == FirebaseAuth.instance.currentUser!.uid);
            final data = state.userModel.firstWhere(
                (element) => element.userID == recentSearchModel.userID);
            return GestureDetector(
              onTap: () {
                context
                    .read<FollowStatusCubit>()
                    .checkFollowStatus(followerID: recentSearchModel.userID);
                Navigation.push(context,
                    SearchResultPage(userID: recentSearchModel.userID));
              },
              child: Row(
                children: [
                  RecentSearchImage(
                      size: size,
                      isDark: isDark,
                      data: data,
                      userData: userData),
                  const SizedBox(width: 8),
                  RecentSearchTexts(
                      data: data, isDark: isDark, userData: userData)
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
