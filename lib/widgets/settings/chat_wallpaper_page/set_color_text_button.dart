import 'package:flutter/material.dart';

import '../../../cubit/update_user_data/update_user_cubit_cubit.dart';

class SetColorTextButton extends StatelessWidget {
  const SetColorTextButton(
      {super.key, required this.pickerColor, required this.updateColor});

  final Color pickerColor;
  final UpdateUserDataCubit updateColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          debugPrint('pickerColor: $pickerColor');
          Color selectedColor = pickerColor;

          String colorValue = '0x${selectedColor.value.toRadixString(16)}';
          debugPrint('selected color value: $colorValue');

          await updateColor.updateUserField(
              fieldName: 'chatbackgroundColor', fieldValue: colorValue);
        },
        child: const Text('SELECT', style: TextStyle(color: Colors.black)));
  }
}
