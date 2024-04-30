import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/cubit/update_user_data/update_user_cubit_cubit.dart';
import 'package:sophiee/cubit/update_user_data/update_user_data_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/edit_profile_page/edit_profile_page_body.dart';
import 'package:sophiee/widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage(
      {super.key, required this.controller, required this.user});
  final TextEditingController controller;
  final UserModel user;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateUserDataCubit, UpdateUserDataStates>(
      listener: (context, state) {
        if (state is UpdateUserDataSuccess) {
          showToastMedthod(
              context: context,
              position: StyledToastPosition.bottom,
              showToastText:
                  'Your profile picture has been updated successfully.');
        } else if (state is UpdateUserDataLoading) {
          var cubit = BlocProvider.of<UpdateUserDataCubit>(context);
          cubit.isSelected = state.isSelected;
        } else if (state is UpdateUserBioSuccess) {
          showToastMedthod(
              position: StyledToastPosition.bottom,
              context: context,
              showToastText: 'Your profile bio has been updated successfully.');
        } else if (state is UpdateUserUserNameSuccess) {
          showToastMedthod(
              position: StyledToastPosition.bottom,
              context: context,
              showToastText: 'Your user name has been updated successfully');
        } else if (state is UpdateUserNickNameSuccess) {
          showToastMedthod(
              position: StyledToastPosition.bottom,
              context: context,
              showToastText: 'Your nick name has been updated successfully');
        }
      },
      builder: (context, state) {
        var updateUserData = context.read<UpdateUserDataCubit>();
        var pickImage = context.read<PickImageCubit>();
        return ModalProgressHUD(
            inAsyncCall: updateUserData.isSelected,
            progressIndicator: Center(
                child: LoadingAnimationWidget.prograssiveDots(
                    color: kPrimaryColor, size: 50)),
            child: Scaffold(
              appBar: AppBar(
                  titleSpacing: -5,
                  title: const Text('Edit Profile',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  backgroundColor: kPrimaryColor,
                  leading: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white))),
              body: EditProfilePageBody(
                takePhoto: () async {
                  Navigator.pop(context);
                  await pickImage.pickImage(source: ImageSource.camera);
                  await updateUserData.uploadProfileImage(
                      selectedImage: pickImage.selectedImage);
                  pickImage.selectedImage = null;
                },
                choosePhoto: () async {
                  Navigator.pop(context);
                  await pickImage.pickImage(source: ImageSource.gallery);
                  await updateUserData.uploadProfileImage(
                      selectedImage: pickImage.selectedImage);
                  pickImage.selectedImage = null;
                },
              ),
            ));
      },
    );
  }
}
