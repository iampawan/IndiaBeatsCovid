import 'package:india_beats_covid/utils/constants.dart';

import '../../pkgs.dart';

class ActionCard extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final String subtitle2;
  final String dense;
  final VoidCallback onTap;
  final Widget iconOrImage;

  const ActionCard(
      {Key key,
      this.color = Vx.emerald400,
      @required this.title,
      this.subtitle,
      this.subtitle2,
      this.dense,
      this.onTap,
      this.iconOrImage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          VxBox().color(color).width(10).make(),
          if (iconOrImage != null) iconOrImage,
          10.widthBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title.text.xl2.semiBold.make(),
                if (subtitle != null)
                  "${Constants.total} Count - $subtitle"
                      .text
                      .bodyText1(context)
                      .make()
                      .py2(),
                if (subtitle2 != null)
                  "$subtitle2".text.bodyText1(context).make().py2(),
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
