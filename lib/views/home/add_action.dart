import 'package:flutter/cupertino.dart';
import 'package:india_beats_covid/views/home/action_card.dart';
import 'package:url_launcher/link.dart';

import '../../pkgs.dart';
import 'apply_volunteer.dart';

class AddAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return [
      Column(
        children: [
          Link(
            uri: Uri.parse("https://indiabeatscovid.in/plasma_donors/new?"),
            target: LinkTarget.blank,
            builder: (context, link) => ActionCard(
              iconOrImage: const Icon(
                CupertinoIcons.add_circled_solid,
                color: Vx.emerald500,
              ).pOnly(left: 8.0),
              subtitle2: "Click here to add",
              title: "Plasma Donor Contact",
              color: Vx.emerald500,
              titleColor: Vx.emerald700,
              onTap: link,
            ),
          ).wFull(context),
          20.heightBox,
          Link(
            uri: Uri.parse("https://indiabeatscovid.in/hospital_beds/new?"),
            target: LinkTarget.blank,
            builder: (context, link) => ActionCard(
              iconOrImage: const Icon(
                CupertinoIcons.add_circled_solid,
                color: Vx.pink500,
              ).pOnly(left: 8.0),
              subtitle2: "Click here to add",
              title: "Hospital Contact",
              color: Vx.pink500,
              titleColor: Vx.pink700,
              onTap: link,
            ),
          ).wFull(context),
          20.heightBox,
          Link(
            uri: Uri.parse("https://indiabeatscovid.in/oxygen_suppliers/new?"),
            target: LinkTarget.blank,
            builder: (context, link) => ActionCard(
              iconOrImage: const Icon(
                CupertinoIcons.add_circled_solid,
                color: Vx.cyan500,
              ).pOnly(left: 8.0),
              subtitle2: "Click here to add",
              title: "Oxygen Supplier Contact",
              color: Vx.cyan500,
              titleColor: Vx.cyan700,
              onTap: link,
            ),
          ).wFull(context),
          20.heightBox,
          Link(
            uri: Uri.parse("https://indiabeatscovid.in/medicines/new?"),
            target: LinkTarget.blank,
            builder: (context, link) => ActionCard(
              iconOrImage: const Icon(
                CupertinoIcons.add_circled_solid,
                color: Vx.amber500,
              ).pOnly(left: 8.0),
              subtitle2: "Click here to add",
              title: "Medicine/Ambulance Contact",
              color: Vx.amber500,
              titleColor: Vx.amber700,
              onTap: link,
            ),
          ).wFull(context),
          20.heightBox,
        ],
      ).wFull(context),
      "If you can bring in more contacts or can help us verify the contacts being received, please join us as a volunteer"
          .text
          .make()
          .p16(),
      ApplyVolunteer().p16(),
    ].vStack();
  }
}
