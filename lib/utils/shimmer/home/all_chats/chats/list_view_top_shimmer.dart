import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ListViewTopShimmer extends StatelessWidget {
  const ListViewTopShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;
    return Shimmer.fromColors(
        baseColor: isDark ? Colors.white12: Colors.grey.shade300,
        highlightColor: isDark ? Colors.white24: Colors.grey.shade100,
        child: SizedBox(
          height: size.height * .14,
          child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 4),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                       padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        children: [
                          CircleAvatar(radius: size.width * .073),
                          SizedBox(height: size.width * .01),
                          Container(
                            height: 8,
                            width: 45,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        ],
                      ),
                    );
                  })),
        ));
  }
}
