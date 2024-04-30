import 'package:sophiee/widgets/settings/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AppBarSettings extends StatefulWidget {
  const AppBarSettings({super.key});

  @override
  State<AppBarSettings> createState() => _AppBarSettingsState();
}

class _AppBarSettingsState extends State<AppBarSettings> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
      widget: TextButton(
        onPressed: () {},
        child: Text(
          'Reset',
          style: TextStyle(color: Colors.white, fontSize: size.width * .039),
        ),
      ),
    );
  }
}
