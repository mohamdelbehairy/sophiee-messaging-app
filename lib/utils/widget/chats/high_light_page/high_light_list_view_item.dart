import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/widget/chats/high_light_page/high_light_list_tile.dart';
import 'package:sophiee/utils/widget/chats/high_light_page/high_light_message_date_time.dart';

class HighLightListViewItem extends StatelessWidget {
  const HighLightListViewItem(
      {super.key,
      required this.message,
      required this.size,
      this.groupModel,
      this.userData});

  final MessageModel message;
  final Size size;
  final GroupModel? groupModel;
  final UserModel? userData;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final data = state.userModel
              .firstWhere((element) => element.userID == message.senderID);
          final userDataModel = state.userModel.firstWhere((element) =>
              element.userID == FirebaseAuth.instance.currentUser!.uid);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HighLightListTile(
                  userDataModel: userDataModel,
                  isDark: isDark,
                  userData: userData,
                  message: message,
                  size: size,
                  user: data,
                  groupModel: groupModel),
              HighLightMessageDateTime(size: size, message: message),
              Container(
                  height: .3,
                  width: size.width,
                  color: Colors.grey.shade400,
                  margin: EdgeInsets.symmetric(horizontal: size.width * .04)),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
