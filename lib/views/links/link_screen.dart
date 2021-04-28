import 'package:flutter/cupertino.dart';
import 'package:india_beats_covid/mutations/get_apis_mutation.dart';
import 'package:india_beats_covid/utils/constants.dart';
import 'package:india_beats_covid/views/common/error_page.dart';

import '../../pkgs.dart';
import 'links_list.dart';

class LinkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ExternalLinksMutation();
    final Store store = VxState.store;
    return VxBuilder(
        builder: (context, status) {
          if (status == VxStatus.none) {
            print("loaded");
            return const CupertinoActivityIndicator().centered();
          } else if (status == VxStatus.success) {
            return LinksList(links: store.externalLinks);
          } else if (status == VxStatus.error) {
            return ErrorPage();
          }
          return Constants.wentWrong.text.xl2.semiBold.makeCentered();
        },
        mutations: {ExternalLinksMutation});
  }
}
