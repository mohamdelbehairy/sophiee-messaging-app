import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/models/send_call_invitation_model.dart';
import 'package:sophiee/utils/widget/send_call_invitation_button.dart';

import '../../constants.dart';
import '../../models/users_model.dart';

class InfoCallsWidget extends StatelessWidget {
  const InfoCallsWidget({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10,right: 8),
      child: Row(
        children: [
          SendCallInvitationButton(
              sendCallInvitationModel: SendCallInvitationModel(
                  isVideoCall: false,
                  userID: user.userID,
                  userName: user.userName,
                  icon: Icons.call,
                  color: Colors.blue,
                  fit: BoxFit.none,
                  iconSize: size.height * .04)),
          const SizedBox(width: 30),
          SendCallInvitationButton(
              sendCallInvitationModel: SendCallInvitationModel(
                  userID: user.userID,
                  userName: user.userName,
                  icon: FontAwesomeIcons.video,
                  color: kPrimaryColor,
                  fit: BoxFit.none,
                  iconSize: size.height * .04)),
        ],
      ),
    );
  }
}
