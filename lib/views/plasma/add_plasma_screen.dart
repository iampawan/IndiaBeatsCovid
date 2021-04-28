import 'package:flutter/cupertino.dart';

import '../../pkgs.dart';

class AddPlasmaScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Add Plasma Donor".text.make(),
      ),
      bottomSheet: SafeArea(
              child: ElevatedButton(
        onPressed: () {
          _formKey.currentState.validate();
        },
        child: "Submit".text.make(),
      ).wh(context.screenWidth, 50))
          .p32(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Add Yourself as COVID-19 Plasma Donor".text.xl.make(),
          10.heightBox,
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: CupertinoFormSection(
              children: [
                CupertinoFormRow(
                  prefix: const Icon(CupertinoIcons.person),
                  child: TextFormField(
                    validator: (value) =>
                        value.isEmptyOrNull ? "Enter a valid name" : null,
                    decoration: const InputDecoration(
                        hintText: "Name", border: InputBorder.none),
                  ).px24(),
                ),
                CupertinoFormRow(
                  prefix: const Icon(CupertinoIcons.phone),
                  child: TextFormField(
                    validator: (value) => value.isEmptyOrNull
                        ? "Enter a valid phone number"
                        : null,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: "Phone", border: InputBorder.none),
                  ).px24(),
                ),
                CupertinoFormRow(
                  prefix: const Icon(CupertinoIcons.phone),
                  child: TextFormField(
                    validator: (value) => null,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: "Alternate Phone (Optional)",
                        border: InputBorder.none),
                  ).px24(),
                ),
                CupertinoFormRow(
                  prefix: const Icon(CupertinoIcons.drop),
                  child: TextFormField(
                    readOnly: true,
                    decoration: const InputDecoration(
                      hintText: "Blood Group",
                      border: InputBorder.none,
                    ),
                  ).px24(),
                ),
                CupertinoFormRow(
                  helper: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "When did you get cured of COVID-19?*".text.make(),
                      VxDiscList(
                        [
                          "If you got cured more than 14 days ago, then people can contact you right now",
                          "If you got cured in under 14 days, then we will reach out to you as soon as 14 days pass"
                        ],
                        color: context.textTheme.bodyText1.color,
                      )
                    ],
                  ),
                  prefix: const Icon(CupertinoIcons.calendar),
                  child: TextFormField(
                    readOnly: true,
                    decoration: const InputDecoration(
                      hintText: "DD/MM/YYYY",
                      border: InputBorder.none,
                    ),
                  ).px24(),
                ),
                CupertinoFormRow(
                  prefix: const Icon(CupertinoIcons.placemark_fill),
                  child: TextFormField(
                    validator: (value) => null,
                    decoration: const InputDecoration(
                      hintText: "Address (Optional)",
                      border: InputBorder.none,
                    ),
                  ).px24(),
                ),
                CupertinoFormRow(
                  prefix: const Icon(CupertinoIcons.placemark),
                  child: TextFormField(
                    validator: (value) =>
                        value.isEmptyOrNull ? "Select a city" : null,
                    decoration: const InputDecoration(
                      hintText: "City",
                      border: InputBorder.none,
                    ),
                  ).px24(),
                ),
                CupertinoFormRow(
                  prefix: const Icon(CupertinoIcons.map_pin),
                  child: TextFormField(
                    validator: (value) => null,
                    decoration: const InputDecoration(
                      hintText: "Pincode (Optional)",
                      border: InputBorder.none,
                    ),
                  ).px24(),
                ),
                CheckboxListTile(
                  value: true,
                  // contentPadding: Vx.m0,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (value) {},
                  title:
                      "I hereby agree to the Terms and Conditions of sharing this data publicly on this website to the best of my knowledge to help the people who need it."
                          .text
                          .make(),
                )
              ],
              header:
                  "Fill this form to add yourself as a plasma donor for COVID-19 patients"
                      .text
                      .caption(context)
                      .make(),
            ),
          ),
          150.heightBox,
        ],
      ).p16().scrollVertical(),
    );
  }
}
