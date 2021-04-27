import 'package:india_beats_covid/core/models/stats.dart';
import 'package:india_beats_covid/utils/constants.dart';
import 'package:india_beats_covid/utils/routes.dart';

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
        "Dashboard".text.bodyText2(context).xl4.semiBold.make().px16(),
        20.heightBox,
        Wrap(
          runSpacing: 20.0,
          alignment: WrapAlignment.spaceAround,
          children: [
            ActionCard(
              title: Constants.plasmaDonors,
              subtitle: stats.plasmaDonors.total.toString(),
              dense: stats.plasmaDonors.formattedTime,
              color: Vx.emerald400,
              onTap: () => context.vxNav.push(Uri.parse(Routes.plasmaRoute)),
            ),
            ActionCard(
              title: Constants.hospitalWithBeds,
              subtitle: stats.hospitalBeds.total.toString(),
              dense: stats.hospitalBeds.formattedTime,
              color: Vx.pink400,
              onTap: () => context.vxNav.push(Uri.parse(Routes.hospitalRoute)),
            ),
            ActionCard(
              title: Constants.oxygenSuppliers,
              subtitle: stats.oxygenSuppliers.total.toString(),
              dense: stats.oxygenSuppliers.formattedTime,
              color: Vx.cyan400,
              onTap: () => context.vxNav.push(Uri.parse(Routes.oxygenRoute)),
            ),
            ActionCard(
              title: Constants.medicineSuppliers,
              subtitle: stats.medicines.total.toString(),
              dense: stats.medicines.formattedTime,
              color: Vx.amber400,
            ),
          ],
        ).wFull(context)
      ],
    );
  }
}
