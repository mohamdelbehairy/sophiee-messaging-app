import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_permissions_page/group_permissions_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupPermissionsPage extends StatelessWidget {
  const GroupPermissionsPage(
      {super.key, required this.size, required this.groupModel});
  final Size size;
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return Scaffold(
      appBar: AppBar(
          titleSpacing: size.width * -.02,
          backgroundColor: kPrimaryColor,
          title: Text('Group permissions',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: size.height * .028))),
      body: GroupPermissionsPageBody(
          size: size, groupModel: groupModel, isDark: isDark),
    );
  }
}
