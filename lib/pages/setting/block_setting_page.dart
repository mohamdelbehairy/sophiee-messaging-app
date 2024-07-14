import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/block/block_cubit.dart';

import '../../widgets/settings/block_setting_page/block_setting_page_body.dart';

class BlockSettingPage extends StatefulWidget {
  const BlockSettingPage({super.key});

  @override
  State<BlockSettingPage> createState() => _BlockSettingPageState();
}

class _BlockSettingPageState extends State<BlockSettingPage> {
  @override
  void initState() {
    context.read<BlockCubit>().getBlock();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: BlockSettingPageBody(size: size),
    );
  }
}
