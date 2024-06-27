import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/update_user_data/update_user_cubit_cubit.dart';
import 'package:sophiee/cubit/upload/upload_image/upload_image_cubit.dart';

class AppBarSaveImageIcon extends StatelessWidget {
  const AppBarSaveImageIcon({super.key, required this.imageFile});
  final File imageFile;

  @override
  Widget build(BuildContext context) {
    var uploadImage = context.read<UploadImageCubit>();
    var updateUserField = context.read<UpdateUserDataCubit>();

    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () async {
        String imageUrl = await uploadImage.uploadImage(
            imageFile: imageFile, fieldName: 'chat_wallpaper_image');

        await updateUserField.updateBackgrounChatField(
            imageUrl: imageUrl, colorValue: null);
      },
      icon: const Icon(Icons.done),
    );
  }
}
