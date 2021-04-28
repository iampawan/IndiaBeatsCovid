import '../../pkgs.dart';

class AddAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      children: [
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Vx.emerald500)),
          onPressed: () {},
          child: "Add Plasma Donor Contact".text.make(),
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Vx.pink500)),
          onPressed: () {},
          child: "Add Hospital Contact".text.make(),
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Vx.cyan500)),
          onPressed: () {},
          child: "Add Oxygen Supplier Contact".text.make(),
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Vx.amber500)),
          onPressed: () {},
          child: "Add Medicine/Ambulance Contact".text.make(),
        )
      ],
    );
  }
}
