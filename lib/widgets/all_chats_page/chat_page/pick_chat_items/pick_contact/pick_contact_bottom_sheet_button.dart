import 'package:sophiee/cubit/notification/message_notification/message_notification_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/cubit/message/message_cubit.dart';
import 'package:sophiee/cubit/pick_contact/pick_contact_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import 'pick_contact_button.dart';

class PickContactBottomSheetButton extends StatelessWidget {
  const PickContactBottomSheetButton(
      {super.key,
      required this.phoneContactName,
      required this.phoneContactNumber,
      required this.user,
      required this.replayContactMessage});
  final String phoneContactName;
  final String phoneContactNumber;
  final UserModel user;
  final String replayContactMessage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final message = context.read<MessageCubit>();
    final pickContact = context.read<PickContactCubit>();
    var sendMessageNotification = context.read<MessageNotificationCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .04),
      child: BlocBuilder<GetUserDataCubit, GetUserDataStates>(
        builder: (context, state) {
          if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
            final currentUser = FirebaseAuth.instance.currentUser;
            final friendUser = user.userID;
            final friendData = state.userModel
                .firstWhere((element) => element.userID == friendUser);
            if (currentUser != null) {
              final userData = state.userModel
                  .firstWhere((element) => element.userID == currentUser.uid);
              String messageID = const Uuid().v4();
              return PickContactButton(
                  message: message,
                  messageID: messageID,
                  phoneContactName: phoneContactName,
                  phoneContactNumber: phoneContactNumber,
                  user: user,
                  replayContactMessage: replayContactMessage,
                  userData: userData,
                  pickContact: pickContact,
                  sendMessageNotification: sendMessageNotification,
                  friendData: friendData,
                  size: size);
            } else {
              return Container();
            }
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
