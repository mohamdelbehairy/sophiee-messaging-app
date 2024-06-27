import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../cubit/user_date/get_user_data/get_user_data_cubit.dart';
import '../../../../cubit/user_date/get_user_data/get_user_data_state.dart';
import '../../../../models/group_model.dart';

class CustomMemberImageCover extends StatelessWidget {
  const CustomMemberImageCover(
      {super.key,
      required this.size,
      required this.isDark,
      required this.groupModel,
      required this.i});

  final Size size;
  final bool isDark;
  final GroupModel groupModel;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Align(
      widthFactor: 0.5,
      child: CircleAvatar(
        radius: size.width * .04,
        backgroundColor: isDark ? cardDarkModeBackground : Colors.white,
        child: BlocBuilder<GetUserDataCubit, GetUserDataStates>(
          builder: (context, state) {
            if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
              final currentUser = groupModel.usersID[i];
              final userData = state.userModel
                  .firstWhere((element) => element.userID == currentUser);
              return CircleAvatar(
                  radius: size.width * .035,
                  backgroundColor: Colors.transparent,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: FancyShimmerImage(
                          boxFit: BoxFit.cover,
                          shimmerBaseColor:
                              isDark ? Colors.white12 : Colors.grey.shade300,
                          shimmerHighlightColor:
                              isDark ? Colors.white24 : Colors.grey.shade100,
                          imageUrl: userData.isProfilePhotos
                              ? userData.profileImage
                              : defaultProfileImageUrl)));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
