import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class CreateGroupAddGroupImage extends StatelessWidget {
  const CreateGroupAddGroupImage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pickImage = context.read<PickImageCubit>();
    return GestureDetector(
      onTap: () async {
        await pickImage.pickImage(source: ImageSource.gallery);
      },
      child: BlocBuilder<PickImageCubit, PickImageStates>(
        builder: (context, state) {
          return CircleAvatar(
            radius: size.height * .03,
            backgroundColor: const Color(0xffced9df),
            backgroundImage: pickImage.selectedImage != null
                ? FileImage(pickImage.selectedImage!)
                : null,
            child: Center(
              child: pickImage.selectedImage == null
                  ? Icon(Icons.camera_alt,
                      color: Colors.white, size: size.height * .03)
                  : Container(),
            ),
          );
        },
      ),
    );
  }
}
