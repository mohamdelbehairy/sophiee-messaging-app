import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/my_friend_page.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;

class FriendsPageListView extends StatelessWidget {
  const FriendsPageListView(
      {super.key, required this.itemCount, required this.friend});
  final int itemCount;
  final List<UserModel> friend;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;
    return Expanded(
      child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
              builder: (context, state) {
                if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
                  final currentUser = friend[index].userID;
                  final data = state.userModel
                      .firstWhere((element) => element.userID == currentUser);
                  return GestureDetector(
                    onTap: () => getnav.Get.to(() => MyFriendPage(user: data),
                        transition: getnav.Transition.leftToRight),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: size.height * .028,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(size.height * .035),
                          child: FancyShimmerImage(
                              boxFit: BoxFit.cover,
                              shimmerBaseColor: isDark
                                  ? Colors.white12
                                  : Colors.grey.shade300,
                              shimmerHighlightColor: isDark
                                  ? Colors.white24
                                  : Colors.grey.shade100,
                              imageUrl: data.profileImage),
                        ),
                      ),
                      title: Text(
                        data.userName,
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            );
          }),
    );
  }
}
