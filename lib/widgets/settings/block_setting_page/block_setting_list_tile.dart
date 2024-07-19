import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/block/block_cubit.dart';

import '../../../cubit/update_user_data/update_user_cubit_cubit.dart';
import '../../../models/users_model.dart';
import 'block_setting_leading.dart';
import 'block_setting_title.dart';
import 'block_setting_training.dart';

class BlockSettingListTile extends StatelessWidget {
  const BlockSettingListTile(
      {super.key,
      required this.userData,
      required this.isDark,
      required this.size,
      required this.blockUser,
      required this.onPressed});

  final UserModel userData;
  final bool isDark;
  final Size size;
  final BlockCubit blockUser;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var updateUser = context.read<UpdateUserDataCubit>();

    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: ListTile(
        minVerticalPadding: 0.0,
        minTileHeight: 0.0,
        title: BlockSettingTitle(userData: userData, isDark: isDark),
        leading:
            BlockSettingLeading(size: size, isDark: isDark, userData: userData),
        trailing: BlockSettingTrailing(
            onPressed: onPressed,
            updateUser: updateUser,
            userData: userData,
            blockUser: blockUser,
            size: size),
      ),
    );
  }
}
