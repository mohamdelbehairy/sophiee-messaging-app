import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/pick_contact/pick_contact_cubit.dart';
import 'package:sophiee/cubit/pick_contact/pick_contact_state.dart';
import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_state.dart';

import '../../cubit/get_friends/get_friends_cubit.dart';
import '../../cubit/get_friends/get_friends_state.dart';

class InitialState {
  static void initPickImageState(BuildContext context) {
    context.read<PickImageCubit>().emit(PickImageInitial());
    context.read<PickImageCubit>().selectedImage = null;
  }

  static void initPickContactState(BuildContext context) {
    context.read<PickContactCubit>().emit(PickContactInitial());
    context.read<PickContactCubit>().phoneContact = null;
  }

  static void initFriendState(BuildContext context) {
    context.read<GetFriendsCubit>().emit(GetFriendsInitial());
  }
}
