import 'package:flutter/cupertino.dart';
import 'package:india_beats_covid/mutations/bottom_bar_mutation.dart';
import 'package:india_beats_covid/mutations/get_apis_mutation.dart';
import 'package:india_beats_covid/utils/constants.dart';
import 'package:india_beats_covid/views/common/error_page.dart';
import 'package:india_beats_covid/views/home/bottom_bar.dart';
import 'package:india_beats_covid/views/home/theme_button.dart';
import 'package:india_beats_covid/views/links/crowdfunding.dart';
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
      bottomNavigationBar: BottomBar(),
      body: VxBuilder(
          builder: (context, status) {
            if (status == VxStatus.none) {
              print("loaded");
              return const CupertinoActivityIndicator().centered();
            } else if (status == VxStatus.success) {
              if (store.selectedIndex == 0)
                return buildHomeWidget(context, store);
              else if (store.selectedIndex == 1)
                return LinkScreen();
              else if (store.selectedIndex == 2) return AddAction();
              return CrowdFunding();
            } else if (status == VxStatus.error) {
              return ErrorPage();
            }
            return Constants.wentWrong.text.xl2.semiBold.makeCentered();
          },
          mutations: {StatsMutation, BottomBarMutation}).p16().scrollVertical(),
    );
  }

  Widget buildHomeWidget(BuildContext context, Store store) {
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
          builder: (context, followLink) =>
              "Declaration/Policy".text.underline.make().onTap(followLink),
        ),
        10.heightBox,
        "Website Support & Requests: ${Constants.mailID}"
            .selectableText
            .textStyle(context.captionStyle)
            .make(),
        10.heightBox,
        "Version - 1.0.0".text.caption(context).make(),
        10.heightBox,
        Link(
          uri: Uri.parse(Constants.devUrl),
          builder: (context, followLink) => "Reach to developer"
              .text
              .rose400
              .underline
              .semiBold
              .make()
              .onTap(followLink),
        ),
      ].vStack(crossAlignment: CrossAxisAlignment.start).p16()
    ].vStack(crossAlignment: CrossAxisAlignment.start);
  }
}
