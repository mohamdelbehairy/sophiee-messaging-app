import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/custom_pop_menu_button.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/group_image_cover.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomMyGroups extends StatelessWidget {
  const CustomMyGroups({super.key, required this.groupModel});
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: isDark ? 1 : 40,
          spreadRadius: 0,
          color: isDark ? Colors.transparent : Colors.transparent,
        )
      ]),
      child: Card(
        color: isDark ? const Color(0xff2b2c33) : Colors.white,
        elevation: isDark ? 1 : 0,
        child: Padding(
          padding: EdgeInsets.only(
            left: size.width * .02,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  CustomPopMenuButton(size: size, groupModel: groupModel)
                ],
              ),
              GroupsCoverImage(groupModel: groupModel, isDark: isDark),
              // SizedBox(height: 8),
              Text(groupModel.groupName,
                  style:
                      TextStyle(color: isDark ? Colors.white : Colors.black)),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < groupModel.usersID.length; i++)
                    Align(
                      widthFactor: 0.5,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: BlocBuilder<GetUserDataCubit, GetUserDataStates>(
                          builder: (context, state) {
                            if (state is GetUserDataSuccess &&
                                state.userModel.isNotEmpty) {
                              final currentUser = groupModel.usersID[i];
                              final userData = state.userModel.firstWhere(
                                  (element) => element.userID == currentUser);
                              return CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.transparent,
                                // backgroundImage:
                                //     NetworkImage(userData.profileImage),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: FancyShimmerImage(
                                      boxFit: BoxFit.cover,
                                      shimmerBaseColor: isDark
                                          ? Colors.white12
                                          : Colors.grey.shade300,
                                      shimmerHighlightColor: isDark
                                          ? Colors.white24
                                          : Colors.grey.shade100,
                                      imageUrl: userData.profileImage),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ),
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
