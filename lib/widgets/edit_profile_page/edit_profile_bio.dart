import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/update_user_data/update_user_cubit_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/widget/custom_bottom.dart';
import 'package:sophiee/widgets/edit_profile_page/edit_profile_bio_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditProfileBio extends StatefulWidget {
  const EditProfileBio({super.key, required this.user});
  final UserModel user;

  @override
  State<EditProfileBio> createState() => _EditProfileBioState();
}

class _EditProfileBioState extends State<EditProfileBio> {
  bool showProgressIndicator = false;
  late TextEditingController controller;

  void onTap() async {
    showProgressIndicator = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 1));
    updateBio();
  }

  void updateBio() {
    context
        .read<UpdateUserDataCubit>()
        .updateUserData(field: bioField, userInfo: controller.text);
    Navigator.pop(context, true);
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.user.bio);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;
    final size = MediaQuery.of(context).size;
    return ModalProgressHUD(
      inAsyncCall: showProgressIndicator,
      progressIndicator: Center(
          child: LoadingAnimationWidget.prograssiveDots(
              color: kPrimaryColor, size: size.height * .05)),
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: size.width * -.025,
          backgroundColor: kPrimaryColor,
          title: const Text(
            'Edit Bio',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Divider(
              thickness: size.width * .001,
              height: size.height * .001,
              color: Colors.grey,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * .02),
                  Text(
                    'Bio',
                    style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                        fontSize: size.width * .042),
                  ),
                  SizedBox(height: size.height * .02),
                  EditProfileBioTextField(
                    controller: controller,
                  ),
                  SizedBox(height: size.width * .01),
                  Text(
                    'Try adding a short bio to tell people more about yourself.\nYour bio is public and limited to 111 characters.',
                    style: TextStyle(
                        color: isDark
                            ? Colors.white60
                            : Colors.black87.withOpacity(.5)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: size.width * .02,
                  left: size.width * .04,
                  right: size.width * .04),
              child: Column(
                children: [
                  CustomBottom(
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(32),
                      text: 'Save',
                      colorBottom: kPrimaryColor,
                      colorText: Colors.white,
                      onPressed: () {
                        onTap();
                      }),
                  SizedBox(height: size.width * .02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your bio is Public.',
                        style: TextStyle(
                          color: isDark
                              ? Colors.white70
                              : Colors.black87.withOpacity(.5),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
