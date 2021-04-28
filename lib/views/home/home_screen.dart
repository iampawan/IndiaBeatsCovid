import 'package:flutter/cupertino.dart';
import 'package:india_beats_covid/mutations/bottom_bar_mutation.dart';
import 'package:india_beats_covid/mutations/get_apis_mutation.dart';
import 'package:india_beats_covid/utils/constants.dart';
import 'package:india_beats_covid/views/common/error_page.dart';
import 'package:india_beats_covid/views/home/apply_volunteer.dart';
import 'package:india_beats_covid/views/home/theme_button.dart';
import 'package:india_beats_covid/views/links/link_screen.dart';
import 'package:url_launcher/link.dart';

import '../../pkgs.dart';
import 'add_action.dart';
import 'dashboard.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    loadAllAPIs();
    final Store store = VxState.store;
    return Scaffold(
      appBar: AppBar(
        title: Constants.appName.text.xl2.semiBold.make(),
        actions: [ThemeButton()],
      ),
      bottomNavigationBar: VxBuilder(
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
                label: "External Links", icon: Icon(CupertinoIcons.link)),
            const BottomNavigationBarItem(
              label: "Add",
              icon: Icon(CupertinoIcons.add),
            ),
          ],
        ),
      ),
      body: VxBuilder(
          builder: (context, status) {
            if (status == VxStatus.none) {
              print("loaded");
              return const CupertinoActivityIndicator().centered();
            } else if (status == VxStatus.success) {
              if (store.selectedIndex == 0)
                return [
                  [
                    "We have a small team of volunteers who are regularly verifying all the contacts submitted."
                        .text
                        .caption(context)
                        .make(),
                    10.heightBox,
                    Dashboard(stats: store.stats),
                  ].vStack(crossAlignment: CrossAxisAlignment.start),
                  [
                    Link(
                      uri: Uri.parse(Constants.policyUrl),
                      builder: (context, followLink) => "Declaration/Policy"
                          .text
                          .underline
                          .make()
                          .onTap(followLink),
                    ),
                    10.heightBox,
                    "Website Support & Requests: ${Constants.mailID}"
                        .selectableText
                        .textStyle(context.captionStyle)
                        .make(),
                  ].vStack(crossAlignment: CrossAxisAlignment.start).p16()
                ].vStack(crossAlignment: CrossAxisAlignment.start);
              else if (store.selectedIndex == 1) return LinkScreen();

              return AddAction();
            } else if (status == VxStatus.error) {
              return ErrorPage();
            }
            return Constants.wentWrong.text.xl2.semiBold.makeCentered();
          },
          mutations: {StatsMutation, BottomBarMutation}).p16().scrollVertical(),
    );
  }
}
