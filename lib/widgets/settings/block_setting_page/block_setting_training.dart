import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../cubit/block/block_cubit.dart';
import '../../../cubit/update_user_data/update_user_cubit_cubit.dart';
import '../../../models/users_model.dart';
import '../../../utils/widget/custom_bottom.dart';

class BlockSettingTrailing extends StatelessWidget {
  const BlockSettingTrailing(
      {super.key,
      required this.updateUser,
      required this.userData,
      required this.blockUser,
      required this.size});

  final UpdateUserDataCubit updateUser;
  final UserModel userData;
  final BlockCubit blockUser;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return CustomBottom(
        text: 'Unblock',
        colorBottom: kPrimaryColor,
        colorText: Colors.white,
        onPressed: () async {
          await updateUser.removeListUsers(
              userID: userData.userID, fieldName: 'blockUsers');
          await blockUser.deleteBlock(userID: userData.userID);
        },
        borderRadius: BorderRadius.circular(24),
        width: size.width * .25);
  }
}
