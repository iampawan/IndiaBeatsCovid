import 'package:url_launcher/link.dart';

import '../../pkgs.dart';

class CrowdFunding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Link(
          uri: Uri.parse("https://hemkuntfoundation.com/donate-now/"),
          builder: (context, followLink) => Card(
            child: ListTile(
              contentPadding: Vx.m0,
              title: "Hemkunt Foundation".text.xl2.bold.make(),
              leading: VxBox().red500.width(10).make(),
              onTap: followLink,
            ),
          ),
        ),
        Link(
          uri: Uri.parse(
              "https://www.ketto.org/fundraiser/mission-oxygen-helping-hospitals-to-save-lives"),
          builder: (context, followLink) => Card(
            child: ListTile(
              contentPadding: Vx.m0,
              title: "Mission Oxygen".text.xl2.bold.make(),
              leading: VxBox().blue500.width(10).make(),
              onTap: followLink,
            ),
          ),
        ),
        Link(
          uri: Uri.parse("https://donate.indiacovidresources.in/"),
          builder: (context, followLink) => Card(
            child: ListTile(
              contentPadding: Vx.m0,
              title: "India Covid Resources - Donate".text.xl2.bold.make(),
              leading: VxBox().orange500.width(10).make(),
              onTap: followLink,
            ),
          ),
        ),
        Link(
          uri: Uri.parse(
              "https://fundraisers.giveindia.org/fundraisers/khaanachahiye-mumbai-is-battling-hunger-along-with-covid-19-again"),
          builder: (context, followLink) => Card(
            child: ListTile(
              contentPadding: Vx.m0,
              title: "Khaana Chahiye".text.xl2.bold.make(),
              leading: VxBox().indigo500.width(10).make(),
              onTap: followLink,
            ),
          ),
        ),
        Link(
          uri: Uri.parse(
              "https://docs.google.com/document/d/1eiobgyrl8iz-R1Dz7c4R5pzzzkuZLBj99vaC7T_UeVo/preview?pru=AAABeSyRln8*PCmPgIgWReCQfUiK7xZ3BQ"),
          builder: (context, followLink) => Card(
            child: ListTile(
              contentPadding: Vx.m0,
              title: "Fundraisers".text.xl2.bold.make(),
              leading: VxBox().rose500.width(10).make(),
              onTap: followLink,
            ),
          ),
        ),
        Link(
          uri: Uri.parse("https://covid.giveindia.org/healthcare-heroes/"),
          builder: (context, followLink) => Card(
            child: ListTile(
              contentPadding: Vx.m0,
              title: "Donate Life Saving Equipments".text.xl2.bold.make(),
              leading: VxBox().gray500.width(10).make(),
              onTap: followLink,
            ),
          ),
        ),
        Link(
          uri: Uri.parse("https://goonj.org/donate/"),
          builder: (context, followLink) => Card(
            child: ListTile(
              contentPadding: Vx.m0,
              title: "Help Migrant Workers".text.xl2.bold.make(),
              leading: VxBox().emerald500.width(10).make(),
              onTap: followLink,
            ),
          ),
        ),
        Link(
          uri: Uri.parse("https://milaap.org/fundraisers/support-hbs-hospital"),
          builder: (context, followLink) => Card(
            child: ListTile(
              contentPadding: Vx.m0,
              title: "Support the Frontline Workers".text.xl2.bold.make(),
              leading: VxBox().purple500.width(10).make(),
              onTap: followLink,
            ),
          ),
        ),
        Link(
          uri: Uri.parse(
              "https://www.ketto.org/fundraiser/DrinkingwaterforCOVIDpatientsmumbai?utm_source=MutualAidIndia"),
          builder: (context, followLink) => Card(
            child: ListTile(
              contentPadding: Vx.m0,
              title: "Drinking Water For Covid Patients".text.xl2.bold.make(),
              leading: VxBox().pink500.width(10).make(),
              onTap: followLink,
            ),
          ),
        ),
        Link(
          uri: Uri.parse(
              "https://www.udayfoundation.org/coronavirus-disease-covid-19/"),
          builder: (context, followLink) => Card(
            child: ListTile(
              contentPadding: Vx.m0,
              title: "Uday Foundation".text.xl2.bold.make(),
              leading: VxBox().lime500.width(10).make(),
              onTap: followLink,
            ),
          ),
        ),
        Link(
          uri: Uri.parse("https://www.akshayapatra.org/covid-relief-services"),
          builder: (context, followLink) => Card(
            child: ListTile(
              contentPadding: Vx.m0,
              title: "Akshaya Patra".text.xl2.bold.make(),
              leading: VxBox().lightBlue500.width(10).make(),
              onTap: followLink,
            ),
          ),
        ),
        Link(
          uri: Uri.parse("https://www.impactguru.com/fundraiser/oxygen"),
          builder: (context, followLink) => Card(
            child: ListTile(
              contentPadding: Vx.m0,
              title: "Oxygen Concetrators Donation".text.xl2.bold.make(),
              leading: VxBox().cyan500.width(10).make(),
              onTap: followLink,
            ),
          ),
        ),
      ],
    ).h(context.percentHeight * 75);
  }
}
