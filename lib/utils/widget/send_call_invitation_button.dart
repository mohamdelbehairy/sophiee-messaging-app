import 'package:flutter/material.dart';
import 'package:sophiee/models/send_call_invitation_model.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class SendCallInvitationButton extends StatelessWidget {
  const SendCallInvitationButton(
      {super.key, required this.sendCallInvitationModel});

  final SendCallInvitationModel sendCallInvitationModel;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: sendCallInvitationModel.fit,
      child: ZegoSendCallInvitationButton(
        isVideoCall: sendCallInvitationModel.isVideoCall,
        verticalLayout: false,
        borderRadius: 0.0,
        timeoutSeconds: 45,
        padding: EdgeInsets.only(left: sendCallInvitationModel.paddingLeft),
        resourceID: "zegouikit_call",
        icon: ButtonIcon(
            icon: Icon(sendCallInvitationModel.icon,
                color: sendCallInvitationModel.color,
                size: sendCallInvitationModel.iconSize ??
                    MediaQuery.sizeOf(context).height * .06)),
        invitees: [
          ZegoUIKitUser(
            id: sendCallInvitationModel.userID,
            name: sendCallInvitationModel.userName,
          ),
        ],
      ),
    );
  }
}
