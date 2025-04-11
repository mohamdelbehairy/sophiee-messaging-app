import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../utils/widget/no_result_found.dart';

class FriendsSelectedListViewHorzItem extends StatelessWidget {
  const FriendsSelectedListViewHorzItem(
      {super.key, required this.size, required this.userID});

  final Size size;
  final String userID;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: size.width * .035, top: size.height * .015),
      child: BlocBuilder<GetUserDataCubit, GetUserDataStates>(
        builder: (context, state) {
          if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
            final userData = state.userModel
                .firstWhere((element) => element.userID == userID);
            return Column(
              children: [
                CircleAvatar(
                    radius: size.height * .03,
                    backgroundColor: Colors.transparent,
                    backgroundImage: CachedNetworkImageProvider(
                        userData.isProfilePhotos
                            ? userData.profileImage
                            : defaultProfileImageUrl)),
                Text(userData.userName.split(' ')[0],
                    style: TextStyle(
                        color: Colors.grey, fontSize: size.width * .03)),
              ],
            );
          } else {
            return  const Center(
                child: CustomNoResultFound(
                  textOne: 'No People Here',
                  textTwo:
                      'You didn\'t have any people yet.\nto create a group with them.',
                ),
              );
          }
        },
      ),
    );
  }
}
