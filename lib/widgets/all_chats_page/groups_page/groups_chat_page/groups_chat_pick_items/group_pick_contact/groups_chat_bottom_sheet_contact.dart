import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'contact_bottom_sheet_group_stack.dart';

class GroupsChatPickContactBottomSheet extends StatelessWidget {
  const GroupsChatPickContactBottomSheet(
      {super.key,
      required this.phoneContactName,
      required this.phoneContactNumber,
      required this.groupModel});
  final String phoneContactName;
  final String phoneContactNumber;
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;

    String formattedPhoneNumber = phoneContactNumber.startsWith('+2')
        ? '+2${phoneContactNumber.substring(2, 3)} ${phoneContactNumber.substring(3, 6)} ${phoneContactNumber.substring(7)}'
        : '+2${phoneContactNumber.substring(0, 1)} ${phoneContactNumber.substring(1, 4)} ${phoneContactNumber.substring(4)}';

    return Container(
        height: size.height * .25,
        width: size.width,
        decoration: BoxDecoration(
            color: isDark ? const Color(0xff2b2c33) : Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(size.width * .04),
                topLeft: Radius.circular(size.width * .04))),
        child: ContactBottomSheetGroupStack(
            size: size,
            phoneContactName: phoneContactName,
            isDark: isDark,
            formattedPhoneNumber: formattedPhoneNumber,
            groupModel: groupModel,
            phoneContactNumber: phoneContactNumber));
  }
}
