import 'package:url_launcher/link.dart';

import '../../pkgs.dart';

class ApplyVolunteer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Link(
      target: LinkTarget.blank,
      uri: Uri.parse("https://indiabeatscovid.in/volunteers/new"),
      builder: (context, followLink) => ElevatedButton(
          onPressed: followLink, child: "Apply as a Volunteer".text.make()),
    );
  }
}
