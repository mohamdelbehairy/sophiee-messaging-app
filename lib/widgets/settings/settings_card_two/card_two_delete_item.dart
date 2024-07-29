import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/cubit/delete_account/delete_account_cubit.dart';
import 'package:sophiee/widgets/settings/custom_items_two.dart';

class CardTwoDeleteItem extends StatelessWidget {
  const CardTwoDeleteItem({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    var deleteAccount = context.read<DeleteAccountCubit>();
    return CustomItemsTwo(
        onTap: () async {
          await deleteAccount.deleteFollowersAndFollowing();
        },
        size: size,
        textColor: const Color(0xfffe6e6e),
        icon2: FontAwesomeIcons.chevronRight,
        text: 'Delete Account',
        iconSize: size.width * .04,
        icon: Icons.person,
        color: const Color(0xfffe6e6e));
  }
}
