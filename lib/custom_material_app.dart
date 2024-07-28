import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sophiee/cubit/all_chats_shimmer_status/all_chats_shimmer_status.dart';
import 'package:sophiee/cubit/auth/auth_settings/auth_settings_cubit.dart';
import 'package:sophiee/cubit/auth/facebook_auth/facebook_auth_cubit.dart';
import 'package:sophiee/cubit/auth/google_auth/google_auth_cubit.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/auth/phone_number_auth/phone_number_auth_cubit.dart';
import 'package:sophiee/cubit/auth/register/register_cubit.dart';
import 'package:sophiee/cubit/block/block_cubit.dart';
import 'package:sophiee/cubit/chat_high_lights/update_chat_high_light/update_chat_high_light_cubit.dart';
import 'package:sophiee/cubit/chat_media_files/chat_get_media_files/chat_get_media_files_cubit.dart';
import 'package:sophiee/cubit/chat_media_files/chat_store_media_files/chat_store_media_files_cubit.dart';
import 'package:sophiee/cubit/chats/chats_cubit.dart';
import 'package:sophiee/cubit/connectivity/connectivity_cubit.dart';
import 'package:sophiee/cubit/copy_text/copy_text_cubit.dart';
import 'package:sophiee/cubit/follow_status/follow_status_cubit.dart';
import 'package:sophiee/cubit/follower/follower_cubit.dart';
import 'package:sophiee/cubit/forward/forward_selected_friend/forward_selected_friend_cubit.dart';
import 'package:sophiee/cubit/forward/forward_selected_group/forward_selected_group_cubit.dart';
import 'package:sophiee/cubit/friends/friends_cubit.dart';
import 'package:sophiee/cubit/get_followers/get_followers_cubit.dart';
import 'package:sophiee/cubit/get_following/get_following_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_cubit.dart';
import 'package:sophiee/cubit/groups/create_groups/create_groups_cubit.dart';
import 'package:sophiee/cubit/groups/delete_group_messages/delete_group_messages_cubit.dart';
import 'package:sophiee/cubit/groups/delete_groups/delete_groups_cubit.dart';
import 'package:sophiee/cubit/groups/get_groups_member/get_groups_member_cubit.dart';
import 'package:sophiee/cubit/groups/group_permissions/group_permissions_cubit.dart';
import 'package:sophiee/cubit/groups/groups_mdeia_files/group_get_media_files/group_get_media_files_cubit.dart';
import 'package:sophiee/cubit/groups/groups_mdeia_files/group_store_media_files/group_store_media_files_cubit.dart';
import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_cubit.dart';
import 'package:sophiee/cubit/groups/groups_members_details/groups_members_details_cubit.dart';
import 'package:sophiee/cubit/groups/high_light_group_message/high_light_messages_user/high_light_messages_user_cubit.dart';
import 'package:sophiee/cubit/groups/high_light_group_message/hight_light_messages/high_light_messages_cubit.dart';
import 'package:sophiee/cubit/groups/message_group/group_message_cubit.dart';
import 'package:sophiee/cubit/is_friend/is_friend_cubit.dart';
import 'package:sophiee/cubit/message/message_cubit.dart';
import 'package:sophiee/cubit/network_error_status/network_error_status_cubit.dart';
import 'package:sophiee/cubit/notification/live_notification/live_notification_cubit.dart';
import 'package:sophiee/cubit/notification/message_notification/message_notification_cubit.dart';
import 'package:sophiee/cubit/notification/notification_setting/notification_setting_cubit.dart';
import 'package:sophiee/cubit/notification/store_notification/store_notification_cubit.dart';
import 'package:sophiee/cubit/open_files/open_files_cubit.dart';
import 'package:sophiee/cubit/pick_contact/pick_contact_cubit.dart';
import 'package:sophiee/cubit/pick_file/pick_file_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/cubit/pick_video/pick_video_cubit.dart';
import 'package:sophiee/cubit/search/delete_recent_search/delete_recent_search_cubit.dart';
import 'package:sophiee/cubit/search/recent_search/recent_search_cubit.dart';
import 'package:sophiee/cubit/selected_chats/selected_chats_cubit.dart';
import 'package:sophiee/cubit/story/story_cubit.dart';
import 'package:sophiee/cubit/update_message_audio_playing/update_message_audio_playing_cubit.dart';
import 'package:sophiee/cubit/update_user_data/update_user_cubit_cubit.dart';
import 'package:sophiee/cubit/upload/upload_audio/upload_audio_cubit.dart';
import 'package:sophiee/cubit/upload/upload_file/upload_file_cubit.dart';
import 'package:sophiee/cubit/upload/upload_image/upload_image_cubit.dart';
import 'package:sophiee/cubit/upload/upload_video/upload_video_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/store_user_date/store_user_date_cubit.dart';
import 'package:sophiee/cubit/user_date/user_token/user_token_cubit.dart';
import 'package:sophiee/services/theme.dart';

import 'cubit/chat_high_lights/chat_high_light_message/chat_high_light_message_cubit.dart';
import 'cubit/delete_messages/delete_chat_message_cubit.dart';
import 'cubit/groups/update_groups_details/update_groups_details_cubit.dart';
import 'cubit/notification/follower_notification/follower_notification_cubit.dart';
import 'cubit/notification/group_notification/group_notification_cubit.dart';
import 'cubit/notification/story_notification/story_notification_cubit.dart';
import 'cubit/user_date/image/delete_image/delete_image_cubit.dart';
import 'cubit/user_date/image/get_image/get_image_cubit.dart';
import 'cubit/user_date/image/store_image/store_image_cubit.dart';

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp(
      {super.key, required this.screen, required this.navigatorKey});

  final Widget screen;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => UpdateUserDataCubit()),
        BlocProvider(create: (context) => GetUserDataCubit()..getUserData()),
        BlocProvider(create: (context) => PickImageCubit()),
        // BlocProvider(create: (context) => ThemeCubit()..changeAppTheme()),
        BlocProvider(create: (context) => FollowerCubit()),
        BlocProvider(create: (context) => FollowStatusCubit()),
        BlocProvider(create: (context) => FriendsCubit()),
        BlocProvider(create: (context) => GetFollowingCubit()),
        BlocProvider(create: (context) => GetFollowersCubit()),
        BlocProvider(create: (context) => GetFriendsCubit()),
        BlocProvider(create: (context) => StoryCubit()),
        BlocProvider(create: (context) => PickVideoCubit()),
        BlocProvider(create: (context) => MessageCubit()),
        BlocProvider(create: (context) => ChatsCubit()),
        BlocProvider(create: (context) => PickFileCubit()),
        BlocProvider(create: (context) => PickContactCubit()),
        BlocProvider(create: (context) => ForwardSelectedFriendCubit()),
        BlocProvider(create: (context) => SelectedChatsCubit()),
        BlocProvider(create: (context) => GroupsMemberSelectedCubit()),
        BlocProvider(create: (context) => CreateGroupsCubit()),
        BlocProvider(create: (context) => GroupMessageCubit()),
        BlocProvider(
            create: (context) => GetGroupsMemberCubit()..getGroupsMember()),
        BlocProvider(create: (context) => UpdateGroupsDetailsCubit()),
        BlocProvider(create: (context) => GroupsMembersDetailsCubit()),
        BlocProvider(create: (context) => DeleteGroupsCubit()),
        BlocProvider(create: (context) => AllChatsShimmerStatusCubit()),
        BlocProvider(create: (context) => ConnectivityCubit()),
        BlocProvider(create: (context) => NetworkErrorStatusCubit()),
        BlocProvider(create: (context) => ForwardSelectedGroupCubit()),
        BlocProvider(create: (context) => UploadAudioCubit()),
        BlocProvider(create: (context) => UpdateMessageAudioPlayingCubit()),
        BlocProvider(create: (context) => UploadImageCubit()),
        BlocProvider(create: (context) => UploadVideoCubit()),
        BlocProvider(create: (context) => UploadFileCubit()),
        BlocProvider(create: (context) => GroupPermissionsCubit()),
        BlocProvider(create: (context) => GroupStoreMediaFilesCubit()),
        BlocProvider(create: (context) => GroupGetMediaFilesCubit()),
        BlocProvider(create: (context) => OpenFilesCubit()),
        BlocProvider(create: (context) => DeleteGroupMessagesCubit()),
        BlocProvider(create: (context) => HighLightMessagesUserCubit()),
        BlocProvider(create: (context) => HightLightMessagesCubit()),
        BlocProvider(create: (context) => ChatStoreMediaFilesCubit()),
        BlocProvider(create: (context) => ChatGetMediaFilesCubit()),
        BlocProvider(create: (context) => DeleteChatMessageCubit()),
        BlocProvider(create: (context) => UpdateChatHighLightCubit()),
        BlocProvider(create: (context) => ChatHighLightMessageCubit()),
        BlocProvider(create: (context) => AuthSettingsCubit()),
        BlocProvider(create: (context) => StoreUserDateCubit()),
        BlocProvider(create: (context) => GoogleAuthCubit()),
        BlocProvider(create: (context) => PhoneNumberAuthCubit()),
        BlocProvider(create: (context) => FacebookAuthCubit()),
        BlocProvider(create: (context) => UserTokenCubit()),
        BlocProvider(create: (context) => NotificationSettingCubit()),
        BlocProvider(create: (context) => FollowerNotificationCubit()),
        BlocProvider(create: (context) => MessageNotificationCubit()),
        BlocProvider(create: (context) => StoreImageCubit()),
        BlocProvider(
            create: (context) => GetImageCubit()
              ..getImage(userID: FirebaseAuth.instance.currentUser!.uid)),
        BlocProvider(create: (context) => DeleteImageCubit()),
        BlocProvider(create: (context) => StoryNotificationCubit()),
        BlocProvider(create: (context) => GroupNotificationCubit()),
        BlocProvider(create: (context) => LiveNotificationCubit()),
        BlocProvider(create: (context) => IsFriendCubit()),
        BlocProvider(create: (context) => CopyTextCubit()),
        BlocProvider(create: (context) => RecentSearchCubit()),
        BlocProvider(create: (context) => DeleteRecentSearchCubit()),
        BlocProvider(create: (context) => BlockCubit()),
        BlocProvider(create: (context) => StoreNotificationCubit()),
      ],
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          ThemeModeService themeModeService = ThemeModeService();
          return GetMaterialApp(
            title: 'Sophiee',
            navigatorKey: navigatorKey,
            color: Colors.transparent,
            debugShowCheckedModeBanner: false,
            theme: themeModeService.lightMode(context: context),
            darkTheme: themeModeService.darkMode(context: context),
            themeMode: context.read<LoginCubit>().isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: screen,
          );
        },
      ),
    );
  }
}
