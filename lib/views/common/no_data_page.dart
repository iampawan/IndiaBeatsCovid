import 'package:flutter_svg/svg.dart';
import 'package:india_beats_covid/utils/constants.dart';

import '../../pkgs.dart';

class NoDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VStack([
      SvgPicture.asset(
        "${Constants.imageAsset}no_data.svg",
        height: context.percentHeight * 40,
      ).centered(),
      20.heightBox,
      Constants.noData.text.xl4.semiBold.makeCentered()
    ]).centered();
  }
}
