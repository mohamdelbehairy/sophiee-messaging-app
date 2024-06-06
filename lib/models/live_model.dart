class LiveModel {
  final String liveID, userID, userName;
  final bool isHost;
  LiveModel(
      {required this.liveID,
      required this.userID,
      required this.userName,
      this.isHost = false});
}
