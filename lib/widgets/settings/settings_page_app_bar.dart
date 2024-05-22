import 'package:sophiee/widgets/settings/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SettingsPageAppBar extends StatefulWidget {
  const SettingsPageAppBar(
      {super.key,
      required this.size,
      this.widget,
      this.arrowIcon,
      this.mainAxisAlignment,
      this.onTapArrowIcon,
      required this.appParTitle,
      this.fontSize});
  final Size size;
  final Widget? widget;
  final Widget? arrowIcon;
  final MainAxisAlignment? mainAxisAlignment;
  final Function()? onTapArrowIcon;
  final String appParTitle;
  final double? fontSize;

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
      fontSize: widget.fontSize,
      onTapArrowIcon: widget.onTapArrowIcon,
      arrowIcon: widget.arrowIcon,
      mainAxisAlignment: widget.mainAxisAlignment,
      size: widget.size,
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
      appParTitle: widget.appParTitle,
      padding: const EdgeInsets.only(left: 0),
      widget: widget.widget,
    );
  }
}
