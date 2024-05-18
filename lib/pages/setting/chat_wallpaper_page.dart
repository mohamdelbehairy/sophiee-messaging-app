import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/auth/login/login_cubit.dart';
import '../../widgets/settings/chat_wallpaper_page/chat_wall_paper_page_card.dart';
import '../../widgets/settings/settings_page_app_bar.dart';

class ChatWallpaperpage extends StatelessWidget {
  const ChatWallpaperpage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var isDark = context.read<LoginCubit>().isDark;

    return Scaffold(
      body: Column(
        children: [
          SettingsPageAppBar(
              size: size,
              appParTitle: 'Chat Wallpaper',
              arrowIcon:
                  const Icon(Icons.arrow_back, color: Colors.white, size: 30)),
          ChatWallPaperPageCard(size: size, isDark: isDark)
        ],
      ),
    );
  }
}
