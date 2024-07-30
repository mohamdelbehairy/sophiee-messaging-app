import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:sophiee/cubit/update_user_data/update_user_cubit_cubit.dart';
import 'package:sophiee/cubit/update_user_data/update_user_data_state.dart';

import 'set_color_text_button.dart';

class SetColorBody extends StatelessWidget {
  const SetColorBody(
      {super.key, required this.pickerColor, required this.onColorChanged});

  final Color pickerColor;
  final void Function(Color) onColorChanged;

  @override
  Widget build(BuildContext context) {
    var updateColor = context.read<UpdateUserDataCubit>();
    return BlocListener<UpdateUserDataCubit, UpdateUserDataStates>(
      listener: (context, state) {
        if (state is UpdateUserDataSuccess) {
          Navigator.pop(context);
        }
      },
      child: AlertDialog(
        title: const Text('Pick Your color',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleChildScrollView(
              child: SlidePicker(
                pickerColor: Colors.red,
                enableAlpha: false,
                // ignore: deprecated_member_use
                sliderTextStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
                onColorChanged: onColorChanged,
              ),
            ),
            SetColorTextButton(
                pickerColor: pickerColor, updateColor: updateColor)
          ],
        ),
      ),
    );
  }
}
