import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:sophiee/cubit/all_chats_shimmer_status/all_chats_shimmer_status.dart';
import 'package:sophiee/pages/chats/all_chats_page.dart';
import 'package:sophiee/pages/profile_page.dart';
import 'package:sophiee/pages/receive_sharing_page.dart';
import 'package:sophiee/pages/setting/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/import_methods.dart';
import '../widgets/all_chats_page/bottom_navigation_bar/custom_bottom_navigtion_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AllChatsShimmerStatusCubit appStatusCubit;
  final _sharedFiles = <SharedMediaFile>[];

  int index = 0;
  final screens = const [
    ProfilePage(),
    AllChatsPage(),
    SettingsPage(),
  ];
  @override
  void initState() {
    super.initState();
    appStatusCubit = context.read<AllChatsShimmerStatusCubit>();
    ImportMethods.importMethod(context, appStatusCubit);
    receiveSharingMethod();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: screens[index],
        bottomNavigationBar: CustomBottomNavigationBar(
            index: index,
            onDestinationSelected: (selectedIndex) {
              setState(() {
                index = selectedIndex;
              });
            }),
      ),
    );
  }

  void receiveSharingMethod() {
    ReceiveSharingIntent.instance.getMediaStream().listen((value) {
      setState(() {
        _sharedFiles.clear();
        _sharedFiles.addAll(value);
        if (_sharedFiles.isNotEmpty) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ReceiveSharingPage(sharedFiles: _sharedFiles)));
        }
      });
    });

    ReceiveSharingIntent.instance.getInitialMedia().then((value) {
      setState(() {
        _sharedFiles.clear();
        _sharedFiles.addAll(value);
        if (_sharedFiles.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ReceiveSharingPage(sharedFiles: _sharedFiles)),
          );
        }

        ReceiveSharingIntent.instance.reset();
      });
    });
  }
}
