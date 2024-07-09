import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/pages/chats/calls_page.dart';
import 'package:sophiee/pages/chats/groups/groups_page.dart';
import 'package:sophiee/pages/search_page.dart';
import 'package:sophiee/widgets/all_chats_page/all_chats_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getnav;

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int titleIndex = 0;
  List<String> titeles = [
    'All Chat',
    'Group',
    'Calls',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: titeles.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text(titeles[titleIndex]),
          actions: [
            SizedBox(
              height: titleIndex != 0 ? 0 : 48,
              width: titleIndex != 0 ? 0 : 48,
              child: titleIndex != 0
                  ? null
                  : IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {},
                      icon: const Icon(Icons.group),
                    ),
            ),
            IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () => getnav.Get.to(() => const SearchPage(),
                  transition: getnav.Transition.rightToLeft),
              icon: const Icon(FontAwesomeIcons.magnifyingGlass,size: 22),
            ),
          ],
          backgroundColor: kPrimaryColor,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Expanded(
                child: TabBar(
                  indicatorColor: Colors.white,
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 8),
                  onTap: (index) {
                    titleIndex = index;
                    setState(() {});
                  },
                  tabs: [
                    Tab(
                      child: Row(
                        children: [
                          const SizedBox(width: 12),
                          Text(
                            'Message',
                            style: TextStyle(
                              color: titleIndex == 0
                                  ? Colors.white
                                  : Colors.white60,
                              fontSize: titleIndex == 0
                                  ? size.width * .04
                                  : size.width * .032,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.white,
                          )
                        ],
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Group',
                        style: TextStyle(
                          color:
                              titleIndex == 1 ? Colors.white : Colors.white60,
                          fontSize: titleIndex == 1
                              ? size.width * .04
                              : size.width * .032,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Calls',
                        style: TextStyle(
                          color:
                              titleIndex == 2 ? Colors.white : Colors.white60,
                          fontSize: titleIndex == 2
                              ? size.width * .04
                              : size.width * .032,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
        body: const Column(
          children: [
            Expanded(
                child: TabBarView(
              children: [
                AllChatsBody(),
                GroupsPage(),
                CallsPage(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
