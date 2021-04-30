import 'package:india_beats_covid/utils/constants.dart';

import '../../pkgs.dart';

class ActionCard extends StatelessWidget {
  final Color color;
  final Color titleColor;
  final String title;
  final String subtitle;
  final String subtitle2;
  final String dense;
  final VoidCallback onTap;
  final Widget iconOrImage;

  const ActionCard(
      {Key key,
      this.color = Vx.emerald400,
      this.titleColor,
      @required this.title,
      this.subtitle,
      this.subtitle2,
      this.dense,
      this.onTap,
      this.iconOrImage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Store store = VxState.store;
    final _titleColor = store.isDarkTheme
        ? context.textTheme.bodyText1.color
        : (titleColor ?? context.theme.textTheme.bodyText1.color);
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          VxBox().color(color).width(10).make(),
          if (iconOrImage != null) iconOrImage,
          10.widthBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                title.text.xl2.extraBold.color(_titleColor).make(),
                if (subtitle != null)
                  "${Constants.total} Count - $subtitle"
                      .text
                      .bodyText1(context)
                      .xl
                      .semiBold
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
          .width(context.percentWidth * 40)
          // .height(Vx.isWeb ? null : context.percentHeight * 18)
          .linearGradient(
            [
              color.withOpacity(store.isDarkTheme ? 1.0 : 0.2),
              if (store.isDarkTheme)
                titleColor.withOpacity(0.2)
              else
                context.cardColor,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )
          .outerShadowSm
          .rounded
          .make(),
    );
  }
}
