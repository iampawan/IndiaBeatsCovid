import 'package:flutter/cupertino.dart';
import 'package:india_beats_covid/mutations/bottom_bar_mutation.dart';
import 'package:india_beats_covid/mutations/get_apis_mutation.dart';
import 'package:india_beats_covid/utils/constants.dart';
import 'package:india_beats_covid/views/common/error_page.dart';
import 'package:india_beats_covid/views/home/bottom_bar.dart';
import 'package:india_beats_covid/views/home/theme_button.dart';
import 'package:india_beats_covid/views/links/crowdfunding.dart';
import 'package:india_beats_covid/views/links/link_screen.dart';
import 'package:india_beats_covid/views/links/twitter_screen.dart';
import 'package:url_launcher/link.dart';

import '../../pkgs.dart';
import 'add_action.dart';
import 'home_widgets.dart';

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
      bottomNavigationBar: BottomBar(),
      body: VxConsumer(
          notifications: {
            CheckVersionMutation: (context, _) {
              if (store.versionChecker.version > Constants.appVersion) {
                showDialog(
                    barrierDismissible: !store.versionChecker.isCompulsory,
                    context: context,
                    builder: (context) => AlertDialog(
                          title:
                              "New Update Available v${store.versionChecker.version}"
                                  .text
                                  .bold
                                  .isIntrinsic
                                  .make(),
                          content: Link(
                            builder: (context, followLink) => [
                              "Download from here:"
                                  .text
                                  .semiBold
                                  .isIntrinsic
                                  .make(),
                              store.versionChecker.link.text.isIntrinsic
                                  .underline
                                  .make()
                            ]
                                .vStack(
                                    crossAlignment: CrossAxisAlignment.start)
                                .onTap(followLink),
                            target: LinkTarget.blank,
                            uri: Uri.parse(store.versionChecker.link),
                          ),
                        ));
              }
            }
          },
          builder: (context, status) {
            if (status == VxStatus.none) {
              print("loaded");
              return const CupertinoActivityIndicator().centered();
            } else if (status == VxStatus.success) {
              if (store.selectedIndex == 0)
                return HomeWidgets().scrollVertical();
              else if (store.selectedIndex == 1)
                return TwitterScreen();
              else if (store.selectedIndex == 2)
                return LinkScreen();
              else if (store.selectedIndex == 3)
                return AddAction().scrollVertical();
              return HomeWidgets();
            } else if (status == VxStatus.error) {
              return ErrorPage();
            }
            return Constants.wentWrong.text.xl2.semiBold.makeCentered();
          },
          mutations: {
            StatsMutation,
            BottomBarMutation,
            CheckVersionMutation
          }).p16(),
    );
  }
}
