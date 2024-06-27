import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/google_auth/google_auth_cubit.dart';
import 'package:sophiee/cubit/user_date/user_token/user_token_cubit.dart';
import 'package:sophiee/pages/home_page.dart';
import 'package:sophiee/widgets/auth/provider_auth_page/custom_provider_way.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;

class GoogleAuthWay extends StatelessWidget {
  const GoogleAuthWay({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    var signInWithGoogle = context.read<GoogleAuthCubit>();
    var token = context.read<UserTokenCubit>();
    
    return BlocConsumer<GoogleAuthCubit, GoogleAuthState>(
      listener: (context, state) async {
        if (state is GoogleAuthSuccess) {
          signInWithGoogle.isLoading = state.isLoading;
          await Future.delayed(const Duration(seconds: 3));
          String? getToken = await token.getUserToken();
          await token.updateUserToken(token: getToken);

          getnav.Get.to(() => const HomePage(),
              transition: getnav.Transition.rightToLeft);
        }
      },
      builder: (context, state) {
        return CustomProviderWay(
            isLoading: signInWithGoogle.isLoading,
            size: size,
            top: size.width * .03,
            text: 'Continue with Google',
            onTap: () async {
              String? getToken = await token.getUserToken();
              await signInWithGoogle.signInWithGoogle(token: getToken);
            },
            widget: Image.asset(googleIconUrl, width: size.height * .035));
      },
    );
  }
}
