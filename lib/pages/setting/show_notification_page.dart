import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/notification/get_notification/get_notification_cubit.dart';

import '../../widgets/settings/show_notification_page/show_notification_app_bar.dart';
import '../../widgets/settings/show_notification_page/show_notification_page_body.dart';

class ShowNotificationPage extends StatefulWidget {
  const ShowNotificationPage({super.key});
  

  @override
  State<ShowNotificationPage> createState() => _ShowNotificationPageState();
}

class _ShowNotificationPageState extends State<ShowNotificationPage> {
  @override
  void initState() {
    BlocProvider.of<GetNotificationCubit>(context).getNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.read<LoginCubit>().isDark
          ? kDarkModeBackgroundColor
          : const Color(0xfff6fafb),
      appBar: showNotificationAppBar(),
      body: const ShowNotificationPageBody(),
    );
  }
}
