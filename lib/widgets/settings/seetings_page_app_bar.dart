import 'package:sophiee/widgets/settings/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SettingsPageAppBar extends StatefulWidget {
  const SettingsPageAppBar({super.key, required this.size, this.widget});
  final Size size;
  final Widget? widget;

  @override
  State<SettingsPageAppBar> createState() => _SettingsPageAppBarState();
}

class _SettingsPageAppBarState extends State<SettingsPageAppBar> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppBarSetting(
      controller: controller,
      onTap: () {
        setState(() {
          controller.clear();
        });
      },
      hintText: 'Search Setting',
      suffixIcon: controller.text.isNotEmpty ? Icons.close : null,
      onChanged: (value) {
        setState(() {});
      },
      appParTitle: 'Setting',
      padding: const EdgeInsets.only(left: 0),
      widget: widget.widget,
    );
  }
}
