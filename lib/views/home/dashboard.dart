import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:india_beats_covid/core/models/stats.dart';
import 'package:india_beats_covid/utils/constants.dart';
import 'package:india_beats_covid/utils/routes.dart';
import 'package:india_beats_covid/utils/utils.dart';
import 'package:url_launcher/link.dart';

import '../../pkgs.dart';
import 'action_card.dart';

class Dashboard extends StatelessWidget {
  final Stats stats;

  const Dashboard({Key key, @required this.stats}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        [
          if (!Vx.isWeb)
            SvgPicture.asset(
              "${Constants.imageAsset}mask-man.svg",
              height: 100.0,
            ),
          "Dashboard".text.bodyText2(context).xl4.semiBold.make(),
        ].hStack(),
        20.heightBox,
        Wrap(
          runSpacing: 20.0,
          spacing: 20.0,
          alignment: WrapAlignment.start,
          children: [
            ActionCard(
              title: Constants.plasmaDonors,
              subtitle: stats?.plasmaDonors?.total?.toString(),
              dense: Utils.getFormattedTime(stats?.plasmaDonors?.formattedTime),
              color: Vx.emerald400,
              onTap: () => context.vxNav.push(Uri.parse(Routes.plasmaRoute)),
            ),
            ActionCard(
              title: Constants.hospitalWithBeds,
              subtitle: stats?.hospitalBeds?.total?.toString(),
              dense: Utils.getFormattedTime(stats?.hospitalBeds?.formattedTime),
              color: Vx.pink400,
              onTap: () => context.vxNav.push(Uri.parse(Routes.hospitalRoute)),
            ),
            ActionCard(
              title: Constants.oxygenSuppliers,
              subtitle: stats?.oxygenSuppliers?.total?.toString(),
              dense:
                  Utils.getFormattedTime(stats?.oxygenSuppliers?.formattedTime),
              color: Vx.cyan400,
              onTap: () => context.vxNav.push(Uri.parse(Routes.oxygenRoute)),
            ),
            ActionCard(
              title: Constants.medicineSuppliers,
              subtitle: stats?.medicines?.total?.toString(),
              dense: stats?.medicines?.formattedTime != "NA"
                  ? Utils.getFormattedTime(stats?.medicines?.formattedTime)
                  : stats?.medicines?.formattedTime,
              color: Vx.amber400,
              onTap: () => context.vxNav.push(Uri.parse(Routes.medicineRoute)),
            ),
          ],
        ),
        20.heightBox,
        ActionCard(
          title: Constants.twitterSearch,
          subtitle2: Constants.twitterResources,
          iconOrImage: const Icon(
            FontAwesome.twitter,
            color: Vx.blue400,
          ).pOnly(left: 8),
          color: Vx.blue400,
          onTap: () => context.vxNav.push(Uri.parse(Routes.twitterSearchRoute)),
        ).wFull(context).pOnly(right: 30.0),
        20.heightBox,
        Link(
          target: LinkTarget.blank,
          uri: Uri.parse("https://selfregistration.cowin.gov.in/"),
          builder: (context, followLink) => ActionCard(
            title: Constants.registerForVaccine,
            subtitle2: Constants.vaccineSub,
            iconOrImage: const Icon(
              MaterialCommunityIcons.medical_bag,
              color: Vx.rose400,
            ).pOnly(left: 8),
            color: Vx.rose400,
            onTap: followLink,
          ).wFull(context).pOnly(right: 30.0),
        ),
        20.heightBox,
        ActionCard(
          title: Constants.treatingCovid,
          subtitle2: Constants.careTips,
          iconOrImage: const Icon(
            AntDesign.Safety,
            color: Vx.purple400,
          ).pOnly(left: 8),
          color: Vx.purple400,
          onTap: () => context.vxNav.push(Uri.parse(Routes.treatingCovidRoute)),
        ).wFull(context).pOnly(right: 30.0),
      ],
    );
  }
}
