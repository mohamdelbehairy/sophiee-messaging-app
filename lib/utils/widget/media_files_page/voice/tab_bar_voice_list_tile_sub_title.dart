import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/media_files_model.dart';

class TabBarListTileSubTitle extends StatelessWidget {
  const TabBarListTileSubTitle(
      {super.key, required this.mediaFiles, required this.size});
  final MediaFilesModel mediaFiles;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<GetUserDataCubit, GetUserDataStates>(
          builder: (context, state) {
            if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
              final currentUser = mediaFiles.senderID;
              final userData = state.userModel
                  .firstWhere((element) => element.userID == currentUser);
              return Text(
                  mediaFiles.senderID == FirebaseAuth.instance.currentUser!.uid
                      ? 'You'
                      : userData.userName,
                  style: TextStyle(
                      fontSize: size.width * .028, color: Colors.white70));
            } else {
              return Container();
            }
          },
        ),
        if (mediaFiles.messageSound != null)
          Text('${mediaFiles.showVoiceDate()} at ${mediaFiles.showVoiceTime()}',
              style:
                  TextStyle(color: Colors.white54, fontSize: size.width * .03)),
      ],
    );
  }
}
