import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBarItemsListTile extends StatelessWidget {
  const TabBarItemsListTile(
      {super.key, required this.user, required this.size, this.widget});
  final UserModel user;
  final Size size;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final currentUser = user.userID;
          final data = state.userModel
              .firstWhere((element) => element.userID == currentUser);
          return Padding(
            padding: EdgeInsets.only(top: size.width * .04),
            child: ListTile(
              title: Text(data.userName,
                  style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontSize: size.width * .038)),
              leading: Stack(
                children: [
                  CircleAvatar(
                    radius: size.height * .028,
                    backgroundColor: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: FancyShimmerImage(
                          boxFit: BoxFit.cover,
                          shimmerBaseColor:
                              isDark ? Colors.white12 : Colors.grey.shade300,
                          shimmerHighlightColor:
                              isDark ? Colors.white24 : Colors.grey.shade100,
                          imageUrl: data.profileImage),
                    ),
                  ),
                  if (widget != null) widget!
                ],
              ),
              subtitle: Text(data.nickName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.grey, fontSize: size.width * .028)),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
