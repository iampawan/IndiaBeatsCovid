import 'package:flutter_icons/flutter_icons.dart';
import 'package:india_beats_covid/utils/routes.dart';

import '../../pkgs.dart';

class ExternalLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.vxNav.push(Uri.parse(Routes.linkRoute)),
      child: Card(
        elevation: 0.0,
        child: ListTile(
          title: "External Links".text.xl.semiBold.make(),
          trailing: const Icon(
            FontAwesome.link,
            color: Vx.indigo400,
          ),
        ),
      ),
    );
  }
}
