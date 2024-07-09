import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class SendCallInvitationButton extends StatelessWidget {
  const SendCallInvitationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ZegoSendCallInvitationButton(
      isVideoCall: true,
      resourceID: "zegouikit_call",
      invitees: [
        ZegoUIKitUser(
          id: "targetUserID",
          name: "targetUserName",
        ),
      ],
    );
  }
}
