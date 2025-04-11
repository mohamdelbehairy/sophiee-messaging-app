import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sophiee/cubit/block/block_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';

import '../../../constants.dart';
import '../../../cubit/auth/login/login_cubit.dart';
import '../../../cubit/update_user_data/update_user_cubit_cubit.dart';
import '../../../utils/widget/no_result_found.dart';
import 'block_setting_list_tile.dart';

class BlockSettingPageListView extends StatefulWidget {
  const BlockSettingPageListView({super.key, required this.size});
  final Size size;

  @override
  State<BlockSettingPageListView> createState() =>
      _BlockSettingPageListViewState();
}

class _BlockSettingPageListViewState extends State<BlockSettingPageListView> {
  bool isClick = false;
  @override
  Widget build(BuildContext context) {
    var blockUser = context.read<BlockCubit>();
    var updateUser = context.read<UpdateUserDataCubit>();
    var isDark = context.read<LoginCubit>().isDark;

    return BlocBuilder<BlockCubit, BlockState>(
      builder: (context, state) {
        if (blockUser.blockList.isEmpty && !isClick) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomNoResultFound(
                  // image: emptyImageUrl,
                  textOne: 'No Blocking Found',
                  textTwo: 'We didn\'t find any users yet'),
            ],
          );
        }
        if (isClick) {
          return Center(
              child: LoadingAnimationWidget.discreteCircle(
                  color: kPrimaryColor, size: widget.size.height * .04));
        }
        return ListView.builder(
            itemCount: blockUser.blockList.length,
            itemBuilder: (context, index) {
              return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
                builder: (context, userState) {
                  if (userState is GetUserDataSuccess &&
                      userState.userModel.isNotEmpty) {
                    final userData = userState.userModel.firstWhere((element) =>
                        element.userID == blockUser.blockList[index].userID);
                    return BlockSettingListTile(
                        onPressed: () {
                          setState(() {
                            isClick = true;
                          });
                          Future.delayed(const Duration(seconds: 2), () async {
                            await updateUser.removeListUsers(
                                userID: userData.userID,
                                fieldName: 'blockUsers');
                            await blockUser.deleteBlock(
                                userID: userData.userID);
                            setState(() {
                              isClick = false;
                            });
                          });
                        },
                        blockUser: blockUser,
                        userData: userData,
                        isDark: isDark,
                        size: widget.size);
                  } else {
                    return const SizedBox();
                  }
                },
              );
            });
      },
    );
  }
}
