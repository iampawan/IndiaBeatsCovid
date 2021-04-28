import 'package:url_launcher/link.dart';

import '../../pkgs.dart';

class AddAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      children: [
        Link(
          uri: Uri.parse("https://indiabeatscovid.in/plasma_donors/new?"),
          target: LinkTarget.blank,
          builder: (context, link) => ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Vx.emerald500)),
            onPressed: link,
            child: "Add Plasma Donor Contact".text.make(),
          ),
        ),
        Link(
          uri: Uri.parse("https://indiabeatscovid.in/hospital_beds/new?"),
          target: LinkTarget.blank,
          builder: (context, link) => ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Vx.pink500)),
            onPressed: () {},
            child: "Add Hospital Contact".text.make(),
          ),
        ),
        Link(
          uri: Uri.parse("https://indiabeatscovid.in/oxygen_suppliers/new?"),
          target: LinkTarget.blank,
          builder: (context, link) => ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Vx.cyan500)),
            onPressed: () {},
            child: "Add Oxygen Supplier Contact".text.make(),
          ),
        ),
        Link(
          uri: Uri.parse("https://indiabeatscovid.in/medicines/new?"),
          target: LinkTarget.blank,
          builder: (context, link) => ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Vx.amber500)),
            onPressed: () {},
            child: "Add Medicine/Ambulance Contact".text.make(),
          ),
        )
      ],
    );
  }
}
