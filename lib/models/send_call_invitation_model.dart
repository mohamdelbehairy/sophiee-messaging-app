import 'package:flutter/material.dart';

class SendCallInvitationModel {
  final String userID, userName;
  final IconData icon;
  final bool isVideoCall;
  final double paddingLeft;
  final Color color;
  final BoxFit fit;
  final double? iconSize;

  SendCallInvitationModel(
      {required this.userID,
      required this.userName,
      required this.icon,
      this.isVideoCall = true,
      this.paddingLeft = 0.0,
      this.color = Colors.white,
      this.fit = BoxFit.scaleDown,
      this.iconSize});
}
