import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/update_user_data/update_user_data_state.dart';
import 'package:sophiee/utils/initial_state.dart';

import '../../cubit/update_user_data/update_user_cubit_cubit.dart';
import '../../widgets/settings/chat_wallpaper_page/pick_image_page/app_bar_save_image_icon.dart';
import '../../widgets/settings/chat_wallpaper_page/pick_image_page/pick_image_oage_app_bar_title.dart';
import '../../widgets/settings/chat_wallpaper_page/pick_image_page/pick_image_page_app_bar_leading.dart';

class ChatWallPaperPickImagePage extends StatelessWidget {
  const ChatWallPaperPickImagePage(
      {super.key, required this.imageFile, required this.size});
  final File imageFile;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateUserDataCubit, UpdateUserDataStates>(
      listener: (context, state) {
        if (state is UpdateUserDataSuccess) {
          Navigator.pop(context);
          InitialState.initPickImageState(context);
        }
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            titleSpacing: -4,
            title: const PickImagePageAppBarTitle(),
            leading: const PickImagePageAppBarleading(),
            actions: [
              AppBarSaveImageIcon(imageFile: imageFile),
            ],
          ),
          body: Center(
              child:
                  Image.file(imageFile, fit: BoxFit.cover, width: size.width)),
        ),
      ),
    );
  }
}
