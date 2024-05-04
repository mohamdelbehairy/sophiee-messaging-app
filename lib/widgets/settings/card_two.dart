import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/auth_settings/auth_settings_cubit.dart';
import 'package:sophiee/cubit/auth/facebook_auth/facebook_auth_cubit.dart';
import 'package:sophiee/cubit/auth/google_auth/google_auth_cubit.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/auth/provider_auth_page.dart';
import 'package:sophiee/widgets/settings/custom_items_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as getnav;
import 'package:shared_preferences/shared_preferences.dart';

class CustomCardTwo extends StatefulWidget {
  const CustomCardTwo({super.key, required this.size, required this.user});
  final Size size;
  final UserModel user;

  @override
  State<CustomCardTwo> createState() => _CustomCardTwoState();
}

class _CustomCardTwoState extends State<CustomCardTwo> {
  bool showProgressIndicator = false;

  void logOut() async {
    var signOut = context.read<AuthSettingsCubit>();
    if (widget.user.isGoogleAuth != null) {
      context.read<GoogleAuthCubit>().isLoading = false;
      await signOut.googleSignOut();
    } else if (widget.user.isFacebookAuth != null) {
      context.read<FacebookAuthCubit>().isLoading = false;
      await signOut.facebookSignOut();
    } else {
      signOut.signOut();
    }

    getnav.Get.to(() => const ProviderAuthPage(),
        transition: getnav.Transition.leftToRight);
  }

  void onTap() async {
    showProgressIndicator = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    logOut();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthSettingsCubit, AuthSettingsState>(
      listener: (context, state) async {
        if (state is EmailSignOutSuccess ||
            state is GoogleSignOutSuccess ||
            state is FacebookSignOutSuccess) {
          context.read<GetFriendsCubit>().emit(GetFriendsInitial());
          final shar = await SharedPreferences.getInstance();
          shar.setString('isFirstTimeUser', 'done');
          debugPrint(shar.getString('isFirstTimeUser'));
        }
      },
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Container(
              height: 155,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.transparent, boxShadow: [
                BoxShadow(
                  blurRadius: 0,
                  color: Colors.transparent,
                  // spreadRadius: 10,
                  // offset: Offset(10, 10),
                )
              ]),
              child: Card(
                color: context.read<LoginCubit>().isDark
                    ? const Color(0xff2b2c33)
                    : Colors.white,
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: onTap,
                        child: CustomItemsTwo(
                          size: widget.size,
                            textColor: context.read<LoginCubit>().isDark
                                ? Colors.white
                                : Colors.black,
                            enableFeedback: false,
                            color: Colors.orange,
                            icon: Icons.lock,
                            iconSize: 18,
                            text: 'Logout'),
                      ),
                      if (showProgressIndicator)
                        const Center(
                          child: CircularProgressIndicator(
                            color: kPrimaryColor,
                          ),
                        ),
                      const SizedBox(height: 12),
                       Expanded(
                        child: CustomItemsTwo(
                          size: widget.size,
                          textColor: Color(0xfffe6e6e),
                          icon2: FontAwesomeIcons.chevronRight,
                          text: 'Delete Account',
                          iconSize: 18,
                          icon: Icons.person,
                          color: Color(0xfffe6e6e),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
