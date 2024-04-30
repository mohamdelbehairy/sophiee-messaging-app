import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class GroupsChatEditPickImage extends StatelessWidget {
  const GroupsChatEditPickImage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var pickImage = context.read<PickImageCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.height * .028, vertical: size.height * .01),
      child: GestureDetector(
        onTap: () async {
          await pickImage.pickImage(source: ImageSource.gallery);
        },
        child: Row(
          children: [
            Icon(Icons.add_a_photo_outlined,
                color: kPrimaryColor, size: size.height * .035),
            SizedBox(width: size.width * .03),
            Text('Set Photo',
                style: TextStyle(
                    color: kPrimaryColor, fontSize: size.width * .035))
          ],
        ),
      ),
    );
  }
}
