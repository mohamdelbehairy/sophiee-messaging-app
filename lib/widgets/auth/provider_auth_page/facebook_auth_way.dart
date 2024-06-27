import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/cubit/auth/facebook_auth/facebook_auth_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/cubit/user_date/user_token/user_token_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/create_account/verificaton_page.dart';
import 'package:sophiee/pages/home_page.dart';
import 'package:sophiee/widgets/auth/provider_auth_page/custom_provider_way.dart';
import 'package:get/get.dart' as getnav;

class FacebookAuthWay extends StatefulWidget {
  const FacebookAuthWay({super.key, required this.size});
  final Size size;

  @override
  State<FacebookAuthWay> createState() => _FacebookAuthWayState();
}

class _FacebookAuthWayState extends State<FacebookAuthWay> {
  late UserModel userData;
  @override
  Widget build(BuildContext context) {
    var signInWithFacebook = context.read<FacebookAuthCubit>();
    var token = context.read<UserTokenCubit>();

    return BlocListener<GetUserDataCubit, GetUserDataStates>(
      listener: (context, userDataState) {
        if (userDataState is GetUserDataSuccess &&
            userDataState.userModel.isNotEmpty) {
          final currentUser = FirebaseAuth.instance.currentUser;
          if (currentUser != null) {
            final user = userDataState.userModel
                .firstWhere((element) => element.userID == currentUser.uid);
            userData = user;
          }
        }
      },
      child: BlocConsumer<FacebookAuthCubit, FacebookAuthState>(
        listener: (context, state) async {
          if (state is FacebookAuthSuccess) {
            signInWithFacebook.isLoading = state.isLoading;
            await Future.delayed(const Duration(seconds: 3));
            String? getToken = await token.getUserToken();
            await token.updateUserToken(token: getToken);

            if (FirebaseAuth.instance.currentUser!.emailVerified) {
              getnav.Get.to(() => const HomePage(),
                  transition: getnav.Transition.rightToLeft);
            } else {
              getnav.Get.to(() => VerificationPage(userData: userData),
                  transition: getnav.Transition.rightToLeft);
            }
          }
        },
        builder: (context, state) {
          return CustomProviderWay(
              isLoading: signInWithFacebook.isLoading,
              size: widget.size,
              top: widget.size.width * .05,
              text: 'Continue with Facebook',
              onTap: () async {
                String? getToken = await token.getUserToken();
                await signInWithFacebook.signInWithFacebook(token: getToken);
              },
              widget:
                  const Icon(FontAwesomeIcons.facebook, color: Colors.blue));
        },
      ),
    );
  }
}
