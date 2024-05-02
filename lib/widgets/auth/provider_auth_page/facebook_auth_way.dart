import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/cubit/auth/facebook_auth/facebook_auth_cubit.dart';
import 'package:sophiee/pages/home_page.dart';
import 'package:sophiee/widgets/auth/provider_auth_page/custom_provider_way.dart';
import 'package:get/get.dart' as getnav;

class FacebookAuthWay extends StatelessWidget {
  const FacebookAuthWay({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    var signInWithFacebook = context.read<FacebookAuthCubit>();
    return BlocConsumer<FacebookAuthCubit, FacebookAuthState>(
      listener: (context, state) async {
        if (state is FacebookAuthSuccess) {
          signInWithFacebook.isLoading = state.isLoading;
          await Future.delayed(const Duration(seconds: 3));

          getnav.Get.to(() => const HomePage(),
              transition: getnav.Transition.rightToLeft);
        }
      },
      builder: (context, state) {
        return CustomProviderWay(
            isLoading: signInWithFacebook.isLoading,
            size: size,
            top: size.width * .05,
            text: 'Continue with Facebook',
            onTap: () async {
              await signInWithFacebook.signInWithFacebook();
            },
            widget: const Icon(FontAwesomeIcons.facebook, color: Colors.blue));
      },
    );
  }
}
