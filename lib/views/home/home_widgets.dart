import 'package:india_beats_covid/utils/constants.dart';
import 'package:url_launcher/link.dart';

import '../../pkgs.dart';
import 'dashboard.dart';

class HomeWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Store store = VxState.store;
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
          target: LinkTarget.blank,
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
        "Version - ${Constants.appVersion}".text.caption(context).make(),
        10.heightBox,
        Link(
          uri: Uri.parse(Constants.devUrl),
          target: LinkTarget.blank,
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
