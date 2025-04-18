import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/user_date/image/get_image/get_image_cubit.dart';
import 'card_three_all_page/card_three_grid_view.dart';

class CardThreeCustomScrollItemTwo extends StatelessWidget {
  const CardThreeCustomScrollItemTwo(
      {super.key,
      required this.getImage,
      required this.size,
      required this.isDark});

  final GetImageCubit getImage;
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: BlocBuilder<GetImageCubit, GetImageState>(
          builder: (context, state) {
            if (getImage.imageList.isNotEmpty) {
              return CardThreeGridView(
                  getImage: getImage,
                  isDark: isDark,
                  size: size,
                  crossAxisCount: 3,
                  physics: const NeverScrollableScrollPhysics());
            } else {
              return Column(
                children: [
                  Text("We don't have any images yet",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: isDark ? Colors.white : Colors.black)),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
