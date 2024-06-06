import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/update_user_data/update_user_cubit_cubit.dart';
import 'package:sophiee/models/live_model.dart';
import 'package:sophiee/services/live_info.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class LivePage extends StatelessWidget {
  const LivePage({super.key, required this.liveModel});

  final LiveModel liveModel;

  @override
  Widget build(BuildContext context) {
    var updateField = context.read<UpdateUserDataCubit>();
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID: LiveInfo.appID,
        appSign: LiveInfo.appSign,
        userID: liveModel.userID,
        userName: liveModel.userName,
        liveID: liveModel.liveID,
        events: ZegoUIKitPrebuiltLiveStreamingEvents(
          onStateUpdated: (state) async {
            if (state == ZegoLiveStreamingState.ended) {
              if (!liveModel.isHost) {
                Navigator.pop(context);
              }
              await updateField.updateUserField(
                  fieldName: 'isLive', fieldValue: false);
            }
            if (state == ZegoLiveStreamingState.living && liveModel.isHost) {
              await updateField.updateUserField(
                  fieldName: 'isLive', fieldValue: true);
            }
          },
          onLeaveConfirmation: (
            ZegoLiveStreamingLeaveConfirmationEvent event,

            /// defaultAction to return to the previous page
            Future<bool> Function() defaultAction,
          ) async {
            return await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return const LivePageAlertDialog();
              },
            );
          },
        ),
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

class LivePageAlertDialog extends StatelessWidget {
  const LivePageAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[900]!.withOpacity(0.9),
      title:
          const Text("End this live", style: TextStyle(color: Colors.white70)),
      content: const Text("Are you sure you want to end the live?",
          style: TextStyle(color: Colors.white70)),
      actions: [
        ElevatedButton(
          child: const Text("Cancel"),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        ElevatedButton(
            child: const Text("Exit"),
            onPressed: () => Navigator.of(context).pop(true)),
      ],
    );
  }
}
