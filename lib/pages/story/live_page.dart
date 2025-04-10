// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
// import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
// import 'package:uuid/uuid.dart';
// import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

// import '../../cubit/get_friends/get_friends_cubit.dart';
// import '../../cubit/get_friends/get_friends_state.dart';
// import '../../cubit/notification/live_notification/live_notification_cubit.dart';
// import '../../cubit/notification/store_notification/store_notification_cubit.dart';
// import '../../cubit/update_user_data/update_user_cubit_cubit.dart';
// import '../../models/users_model.dart';
// import '../../services/live_app_info.dart';
// import '../../widgets/all_chats_page/add_story/live_page/live_page_alert_dialog.dart';
// import '../../widgets/all_chats_page/add_story/live_page/live_page_config.dart';

// class LivePage extends StatefulWidget {
//   const LivePage({super.key, required this.liveID, this.isHost = false});

//   final String liveID;
//   final bool isHost;

//   @override
//   State<LivePage> createState() => _LivePageState();
// }

// class _LivePageState extends State<LivePage> {
//   List<UserModel>? items;

//   @override
//   Widget build(BuildContext context) {
//     var updateField = context.read<UpdateUserDataCubit>();
//     var liveNotification = context.read<LiveNotificationCubit>();
//     var storeNotification = context.read<StoreNotificationCubit>();

//     if (widget.isHost) {
//       context
//           .read<GetFriendsCubit>()
//           .getFriends(userID: FirebaseAuth.instance.currentUser!.uid);
//     }

//     return BlocListener<GetFriendsCubit, GetFriendsState>(
//       listener: (context, friendState) {
//         if (friendState is GetFriendsSuccess) {
//           items = friendState.friends;
//         }
//       },
//       child: BlocBuilder<GetUserDataCubit, GetUserDataStates>(
//         builder: (context, state) {
//           if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
//             List<UserModel> items2 = state.userModel;
//             String notificationID = const Uuid().v4();
//             final currentUser = FirebaseAuth.instance.currentUser;
//             if (currentUser != null) {
//               final userData = state.userModel
//                   .firstWhere((element) => element.userID == currentUser.uid);
//               return SafeArea(
//                 child: ZegoUIKitPrebuiltLiveStreaming(
//                   appID: LiveInfo.appID,
//                   appSign: LiveInfo.appSign,
//                   userID: userData.userID,
//                   userName: userData.userName,
//                   liveID: '123456',
//                   events: ZegoUIKitPrebuiltLiveStreamingEvents(
//                     onStateUpdated: (state) async {
//                       if (state == ZegoLiveStreamingState.ended) {
//                         if (!widget.isHost) {
//                           Navigator.pop(context);
//                         }
//                         await updateField.updateUserField(
//                             fieldName: 'isLive', fieldValue: false);

//                         if (items != null) {
//                           for (var element in items!) {
//                             var data = items2
//                                 .firstWhere((e) => e.userID == element.userID);
//                             await storeNotification.updateNotificationField(
//                                 userID: data.userID,
//                                 fieldName: 'isLive',
//                                 fieldValue: null,
//                                 notificationID: notificationID);
//                           }
//                         }
//                       }
//                       if (state == ZegoLiveStreamingState.living &&
//                           widget.isHost) {
//                         await updateField.updateUserField(
//                             fieldName: 'isLive', fieldValue: true);
//                         if (items != null) {
//                           for (var element in items!) {
//                             var data = items2
//                                 .firstWhere((e) => e.userID == element.userID);
//                             await storeNotification.storeNotification(
//                                 userID: data.userID,
//                                 notificationType: "live",
//                                 isLive: true,
//                                 notificationID: notificationID);
//                             if (data.isLivesNotify) {
//                               await liveNotification.sendLiveNotification(
//                                   receiverToken: data.token,
//                                   senderName: userData.userName,
//                                   senderId: userData.userID);
//                               log('token: ${data.token}');
//                             }
//                           }
//                         }
//                       }
//                     },
//                     onLeaveConfirmation: (
//                       ZegoLiveStreamingLeaveConfirmationEvent event,

//                       /// defaultAction to return to the previous page
//                       Future<bool> Function() defaultAction,
//                     ) async {
//                       return await showDialog(
//                         context: context,
//                         barrierDismissible: false,
//                         builder: (BuildContext context) {
//                           return LivePageAlertDialog(isHost: widget.isHost);
//                         },
//                       );
//                     },
//                   ),
//                   config: livePageConfig(widget.isHost),
//                 ),
//               );
//             } else {
//               return Container();
//             }
//           } else {
//             return Container();
//           }
//         },
//       ),
//     );
//   }
// }
