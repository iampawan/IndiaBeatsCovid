import 'package:flutter/cupertino.dart';
import 'package:india_beats_covid/mutations/bottom_bar_mutation.dart';

import '../../pkgs.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Store store = VxState.store;
    return VxBuilder(
      mutations: {BottomBarMutation},
      builder: (context, _) => CupertinoTabBar(
        onTap: (value) => BottomBarMutation(value),
        currentIndex: store.selectedIndex,
        items: [
          const BottomNavigationBarItem(
            label: "Home",
            icon: Icon(CupertinoIcons.home),
          ),
          const BottomNavigationBarItem(
            label: "Twitter Search",
            icon: Icon(CupertinoIcons.search),
          ),
          const BottomNavigationBarItem(
              label: "External Links", icon: Icon(CupertinoIcons.link)),
          const BottomNavigationBarItem(
            label: "Contribute",
            icon: Icon(CupertinoIcons.add),
          ),
        ],
      ),
    );
  }
}
