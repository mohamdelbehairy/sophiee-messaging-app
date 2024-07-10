import 'package:flutter/material.dart';

class SendCallInvitationModel {
  final String userID, userName;
  final IconData icon;
  final bool isVideoCall;
  final double left;

  SendCallInvitationModel(
      {required this.userID,
      required this.userName,
      required this.icon,
      this.isVideoCall = true,
      this.left = 0.0});
}
