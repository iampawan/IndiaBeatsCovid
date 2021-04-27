import 'package:flutter/cupertino.dart';
import 'package:india_beats_covid/mutations/get_apis_mutation.dart';
import 'package:india_beats_covid/utils/constants.dart';
import 'package:india_beats_covid/views/common/error_page.dart';
import 'package:india_beats_covid/views/home/theme_button.dart';

import '../../pkgs.dart';
import 'dashboard.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // loadAllAPIs();
  }

  @override
  Widget build(BuildContext context) {
    loadAllAPIs();
    final Store store = VxState.store;
    return Scaffold(
      appBar: AppBar(
        title: Constants.appName.text.xl2.semiBold.make(),
        actions: [ThemeButton()],
      ),
      body: VStack(
        [
          VxBuilder(
              builder: (context, status) {
                if (status == VxStatus.none) {
                  print("loaded");
                  return const CupertinoActivityIndicator().centered();
                } else if (status == VxStatus.success) {
                  return Dashboard(stats: store.stats);
                } else if (status == VxStatus.error) {
                  return ErrorPage();
                }
                return Constants.wentWrong.text.xl2.semiBold.makeCentered();
              },
              mutations: {StatsMutation})
        ],
        crossAlignment: CrossAxisAlignment.center,
        alignment: MainAxisAlignment.center,
      ).p16().scrollVertical(),
    );
  }
}
