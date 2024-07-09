import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/pages/search_result_page.dart';

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
            final data = state.userModel.firstWhere(
                (element) => element.userID == recentSearchModel.userID);
            return GestureDetector(
              onTap: () => getnav.Get.to(
                  () => SearchResultPage(userID: recentSearchModel.userID),
                  transition: getnav.Transition.rightToLeft),
              child: Row(
                children: [
                  RecentSearchImage(size: size, isDark: isDark, data: data),
                  const SizedBox(width: 8),
                  RecentSearchTexts(data: data, isDark: isDark)
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
