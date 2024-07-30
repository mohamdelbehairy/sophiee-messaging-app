import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/delete_account/delete_account_cubit.dart';

import '../utils/methods/delete_account_action.dart';
import '../utils/widget/loading_animation_circle_indicator.dart';

class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({super.key});

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  @override
  void initState() {
    context.read<DeleteAccountCubit>().deleteAccount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
      listener: (context, state) async {
        if (state is DeleteAccountSuccess) {
          await deleteAccountAction(context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          opacity: 0.1,
          inAsyncCall: state is DeleteAccountLoading ? true : false,
          progressIndicator: LoadingAnimationCircleIndicator(size: size),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              title: const Text('Deleting Account',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.normal)),
            ),
          ),
        );
      },
    );
  }
}
