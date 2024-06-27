import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';

import '../../widgets/settings/general_setting_page/general_setting_page_card.dart';
import '../../widgets/settings/settings_page_app_bar.dart';

class GeneralSettingPage extends StatelessWidget {
  const GeneralSettingPage({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;

    return Scaffold(
      body: Column(
        children: [
          SettingsPageAppBar(
              size: size,
              appParTitle: 'General',
              arrowIcon:
                  const Icon(Icons.arrow_back, color: Colors.white, size: 30)),
          GeneralSettingCard(size: size, isDark: isDark)
        ],
      ),
    );
  }
}
