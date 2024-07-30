class SettingBottomSheetModel {
  final String title, body, buttonName;
  final Function() onTap;
  final double? titleSize;

  SettingBottomSheetModel(
      {required this.title,
      required this.body,
      required this.buttonName,
      required this.onTap,
      this.titleSize});
}
