import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';

import '../../widgets/settings/notification_setting_page/notification_setting_page_card.dart';
import '../../widgets/settings/settings_page_app_bar.dart';

class NotificationSettingPage extends StatelessWidget {
  const NotificationSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var isDark = context.read<LoginCubit>().isDark;
    return Scaffold(
      body: Column(
        children: [
          SettingsPageAppBar(
              size: size,
              appParTitle: 'Notification',
              arrowIcon:
                  const Icon(Icons.arrow_back, color: Colors.white, size: 30)),
          NotificationSettingPageCard(size: size, isDark: isDark)
        ],
      ),
    );
  }
}

