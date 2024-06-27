import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/update_user_data/update_user_cubit_cubit.dart';
import 'package:sophiee/utils/initial_state.dart';

import '../../cubit/pick_image/pick_image_cubit.dart';
import '../../cubit/pick_image/pick_image_state.dart';
import '../../cubit/upload/upload_image/upload_image_cubit.dart';
import '../settings/settings_page_app_bar.dart';
import 'edit_profile_component_details.dart';

class EditProfilePageBodyComponent extends StatelessWidget {
  const EditProfilePageBodyComponent(
      {super.key,
      required this.uploadImage,
      required this.updateUserData,
      required this.size,
      required this.pickImage});

  final UploadImageCubit uploadImage;
  final UpdateUserDataCubit updateUserData;
  final Size size;
  final PickImageCubit pickImage;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      opacity: 0.1,
      inAsyncCall: uploadImage.isLoading == false
          ? updateUserData.isLoading
          : uploadImage.isLoading,
      progressIndicator: LoadingAnimationWidget.discreteCircle(
          color: kPrimaryColor, size: size.height * .04),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SettingsPageAppBar(
                appParTitle: 'Edit Profile',
                size: size,
                fontSize: size.height * .03,
                arrowIcon:
                    const Icon(Icons.arrow_back, color: Colors.white, size: 35),
                onTapArrowIcon: () {
                  if (pickImage.state is PickImageSucccess) {
                    InitialState.initPickImageState(context);
                  }
                  Navigator.pop(context);
                },
              ),
              EditProfileComponentDetails(
                  size: size,
                  pickImage: pickImage,
                  updateUserDate: updateUserData,
                  uploadImage: uploadImage)
            ],
          ),
        ),
      ),
    );
  }
}
