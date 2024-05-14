import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/utils/widget/no_result_found.dart';

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
              return CustomNoResultFound(
                  height: size.height * .15,
                  sizedBoxHeightOne: size.height * .005,
                  sizedBoxHeightTwo: size.height * .001,
                  textOneFontSize: size.height * .022,
                  textTwoFontSize: size.height * .012,
                  mainAxisAlignment: MainAxisAlignment.start,
                  textOne: 'No Images here',
                  textTwo: 'We didn\'t find any images yet \n Please add a new image');
            }
          },
        ),
      ),
    );
  }
}
