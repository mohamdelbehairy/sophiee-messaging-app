import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/update_user_data/update_user_cubit_cubit.dart';
import 'package:sophiee/cubit/update_user_data/update_user_data_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/edit_profile_page/edit_profile_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditProfileName extends StatefulWidget {
  const EditProfileName({super.key, required this.user});
  final UserModel user;

  @override
  State<EditProfileName> createState() => _EditProfileNamePageState();
}

class _EditProfileNamePageState extends State<EditProfileName> {
  late TextEditingController firstName;
  bool showProgressIndicator = false;

  void onTap() async {
    showProgressIndicator = true;
    setState(() {});
    var updateName = context.read<UpdateUserDataCubit>();
    await Future.delayed(const Duration(seconds: 2));

    if (firstName.text.isNotEmpty) {
      updateName.updateUserData(field: 'userName', userInfo: firstName.text);
      navigatorPop();
    }
  }

  void navigatorPop() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    firstName = TextEditingController(text: widget.user.userName);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateUserDataCubit, UpdateUserDataStates>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: showProgressIndicator,
          progressIndicator: Center(
              child: LoadingAnimationWidget.prograssiveDots(
                  color: kPrimaryColor, size: 50)),
          child: Scaffold(
            appBar: AppBar(
              titleSpacing: -5,
              backgroundColor: kPrimaryColor,
              title: const Text(
                'Edit User Name',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Divider(
                  thickness: 1,
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              actions: [
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    if (firstName.text.isNotEmpty &&
                        firstName.text != widget.user.userName) {
                      onTap();
                    }
                  },
                  icon: const Icon(Icons.done, color: Colors.white, size: 30),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  EditProfileTextField(
                    hintText: 'Name (required)',
                    controller: firstName,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
