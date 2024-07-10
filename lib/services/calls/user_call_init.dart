import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import 'call_app_info.dart';

abstract class UserCallInit {
  static void onUserLogin({required String userID, required String userName}) {
    ZegoUIKitPrebuiltCallInvitationService().init(
        appID: CallInfo.appID,
        appSign: CallInfo.appSign,
        userID: userID,
        userName: userName,
        notificationConfig: ZegoCallInvitationNotificationConfig(
          androidNotificationConfig: ZegoCallAndroidNotificationConfig(
            showFullScreen: true,
          ),
        ),
        plugins: [ZegoUIKitSignalingPlugin()]);
  }

  static void onUserLogout() {
    ZegoUIKitPrebuiltCallInvitationService().uninit();
  }
}
