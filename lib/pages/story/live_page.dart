import 'package:flutter/material.dart';
import 'package:sophiee/models/live_model.dart';
import 'package:sophiee/services/live_info.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class LivePage extends StatelessWidget {
  const LivePage({super.key, required this.liveModel});

  final LiveModel liveModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID: LiveInfo.appID,
        appSign: LiveInfo.appSign,
        userID: liveModel.userID,
        userName: liveModel.userName,
        liveID: liveModel.liveID,
        config: liveModel.isHost
            ? ZegoUIKitPrebuiltLiveStreamingConfig.host(
                plugins: [ZegoUIKitSignalingPlugin()],
              )
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience(
                plugins: [ZegoUIKitSignalingPlugin()],
              ),
      ),
    );
  }
}
