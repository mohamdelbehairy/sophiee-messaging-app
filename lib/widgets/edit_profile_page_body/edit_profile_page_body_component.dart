import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sophiee/constants.dart';

import '../../cubit/pick_image/pick_image_cubit.dart';
import '../../cubit/upload/upload_image/upload_image_cubit.dart';
import '../../cubit/user_date/store_user_date/store_user_date_cubit.dart';
import '../settings/seetings_page_app_bar.dart';
import 'edit_profile_component_details.dart';

class EditProfilePageBodyComponent extends StatelessWidget {
  const EditProfilePageBodyComponent(
      {super.key,
      required this.uploadImage,
      required this.storeUserData,
      required this.size,
      required this.pickImage});

  final UploadImageCubit uploadImage;
  final StoreUserDateCubit storeUserData;
  final Size size;
  final PickImageCubit pickImage;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      opacity: 0.1,
      inAsyncCall: uploadImage.isLoading == false
          ? storeUserData.isLoading
          : uploadImage.isLoading,
      progressIndicator: LoadingAnimationWidget.discreteCircle(
          color: kPrimaryColor, size: size.height * .04),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SettingsPageAppBar(size: size),
              EditProfileComponentDetails(
                  size: size,
                  pickImage: pickImage,
                  storeUserDate: storeUserData,
                  uploadImage: uploadImage)
            ],
          ),
        ),
      ),
    );
  }
}
