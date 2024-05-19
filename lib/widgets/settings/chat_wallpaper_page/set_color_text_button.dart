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

          int colorValue = selectedColor.value;
          debugPrint('selected color value: ${Color(colorValue)}');

          await updateColor.updateUserField(
              colorValue: colorValue, imageUrl: null);
        },
        child: const Text('SELECT', style: TextStyle(color: Colors.black)));
  }
}
