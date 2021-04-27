import 'package:india_beats_covid/core/models/stats.dart';
import 'package:india_beats_covid/utils/constants.dart';

import '../../pkgs.dart';

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
            ),
            ActionCard(
              title: Constants.hospitalWithBeds,
              subtitle: stats.hospitalBeds.total.toString(),
              dense: stats.hospitalBeds.formattedTime,
              color: Vx.pink400,
            ),
            ActionCard(
              title: Constants.oxygenSuppliers,
              subtitle: stats.oxygenSuppliers.total.toString(),
              dense: stats.oxygenSuppliers.formattedTime,
              color: Vx.cyan400,
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

class ActionCard extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final String dense;

  const ActionCard(
      {Key key,
      this.color = Vx.emerald400,
      @required this.title,
      @required this.subtitle,
      this.dense})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        VxBox().color(color).width(10).make(),
        10.widthBox,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title.text.xl2.semiBold.make(),
              "${Constants.total} Count - $subtitle"
                  .text
                  .bodyText1(context)
                  .make()
                  .py2(),
              if (dense != null)
                "${Constants.lastUpdated} - $dense"
                    .text
                    .caption(context)
                    .make()
                    .py2(),
            ],
          ).p8(),
        )
      ],
    )
        .box
        .clip(Clip.antiAlias)
        .color(context.theme.cardColor)
        .width(context.percentWidth * 40)
        .height(context.percentHeight * 18)
        .border(color: color)
        .roundedSM
        .make();
  }
}
