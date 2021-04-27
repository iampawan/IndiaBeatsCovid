import 'package:india_beats_covid/utils/constants.dart';

import '../../pkgs.dart';

class ActionCard extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final String dense;
  final VoidCallback onTap;

  const ActionCard(
      {Key key,
      this.color = Vx.emerald400,
      @required this.title,
      @required this.subtitle,
      this.dense,
      this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
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
          .make(),
    );
  }
}
