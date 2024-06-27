import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/constants.dart';

import '../cubit/user_date/image/get_image/get_image_cubit.dart';
import '../widgets/profile_page/profile_page_card_three/card_three_all_page/card_three_grid_view.dart';

class CardThreeSeeAllPage extends StatelessWidget {
  const CardThreeSeeAllPage(
      {super.key,
      required this.getImage,
      required this.size,
      required this.isDark});
  final GetImageCubit getImage;
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetImageCubit, GetImageState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
                titleSpacing: size.width * -.02,
                backgroundColor: kPrimaryColor,
                title: const Text('images',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w400))),
            body: CardThreeGridView(
                physics: const BouncingScrollPhysics(),
                getImage: getImage,
                isDark: isDark,
                size: size,
                crossAxisCount: 2));
      },
    );
  }
}
