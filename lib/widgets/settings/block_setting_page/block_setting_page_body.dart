import 'package:flutter/material.dart';

import '../settings_page_app_bar.dart';
import 'block_setting_page_list_view.dart';

class BlockSettingPageBody extends StatelessWidget {
  const BlockSettingPageBody({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsPageAppBar(
            size: size,
            appParTitle: 'Blocking',
            arrowIcon:
                const Icon(Icons.arrow_back, color: Colors.white, size: 30)),
        Expanded(child: BlockSettingPageListView(size: size))
      ],
    );
  }
}

