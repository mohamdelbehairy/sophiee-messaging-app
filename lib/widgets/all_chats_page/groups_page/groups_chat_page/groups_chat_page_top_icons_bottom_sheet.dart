import 'package:sophiee/utils/navigation.dart';
import 'package:sophiee/cubit/pick_file/pick_file_cubit.dart';
import 'package:sophiee/cubit/pick_file/pick_file_state.dart';
import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_state.dart';
import 'package:sophiee/cubit/pick_video/pick_video_cubit.dart';
import 'package:sophiee/cubit/pick_video/pick_video_state.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/pages/chats/groups/groups_chat_pick_file_page.dart';
import 'package:sophiee/pages/chats/groups/groups_chat_pick_image_page.dart';
import 'package:sophiee/pages/chats/groups/groups_chat_pick_video_page.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/bottom_sheet/icons_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class GroupsChatPageTopIconsBottomSheet extends StatelessWidget {
  const GroupsChatPageTopIconsBottomSheet(
      {super.key, required this.groupModel});
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pickImage = context.read<PickImageCubit>();
    final pickVideo = context.read<PickVideoCubit>();
    final pickFile = context.read<PickFileCubit>();
    

    return BlocListener<PickImageCubit, PickImageStates>(
      listener: (context, state) {
        if (state is PickImageSucccess) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GroupsChatPickImagePage(
                        tokens: const [],
                        isNotify: const [],
                        senderName: '',
                        image: state.image,
                        groupModel: groupModel,
                        replayTextMessage: '',
                        replayImageMessage: '',
                        replayFileMessage: '',
                        replayContactMessage: '',
                        friendNameReplay: '',
                        replayMessageID: '',
                        replayRecordMessage: '',
                        replaySoundMessage: '',
                      )));
        }
      },
      child: BlocListener<PickVideoCubit, PickVideoState>(
        listener: (context, state) {
          if (state is PickVideoSuccess) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GroupsChatPickVideoPage(
                        tokens: const [],
                        isNotify: const [],
                        senderName: '',
                        video: state.video,
                        groupModel: groupModel)));
          }
        },
        child: BlocListener<PickFileCubit, PickFileState>(
          listener: (context, state) {
            if (state is PickFileSuccess) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GroupsChatPickFilePage(
                            tokens: const [],
                            isNotify: const [],
                            senderName: '',
                            groupModel: groupModel,
                            file: state.file,
                            replayTextMessage: '',
                            replayContactMessage: '',
                            replayFileMessage: '',
                            replayImageMessage: '',
                            replayMessageID: '',
                            friendNameReplay: '',
                            replayRecordMessage: '',
                            replaySoundMessage: '',
                          )));
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconBottomSheet(
                  onTap: () async {
                    await pickFile.pickFile(allowedExtensions: ['pdf', 'doc']);
                    // ignore: use_build_context_synchronously
                    Navigation.pop(context);
                  },
                  text: 'File',
                  color: Colors.indigo,
                  icon: Icons.insert_drive_file),
              SizedBox(width: size.width * .08),
              CustomIconBottomSheet(
                  onTap: () async {
                    await pickVideo.pickVideo(source: ImageSource.gallery);
                    // ignore: use_build_context_synchronously
                    Navigation.pop(context);
                  },
                  text: 'Video',
                  color: Colors.pink,
                  icon: Icons.collections),
              SizedBox(width: size.width * .08),
              CustomIconBottomSheet(
                  onTap: () async {
                    await pickImage.pickImage(source: ImageSource.gallery);
                    // ignore: use_build_context_synchronously
                    Navigation.pop(context);
                  },
                  text: 'Gallery',
                  color: Colors.purple,
                  icon: Icons.insert_photo)
            ],
          ),
        ),
      ),
    );
  }
}
