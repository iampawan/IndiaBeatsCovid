import 'package:flutter/cupertino.dart';
import 'package:india_beats_covid/core/models/medicine.dart';
import 'package:india_beats_covid/mutations/get_apis_mutation.dart';
import 'package:india_beats_covid/utils/utils.dart';
import 'package:india_beats_covid/views/common/my_rich_text.dart';
import 'package:india_beats_covid/views/common/no_data_page.dart';

import '../../pkgs.dart';

class MedicinesList extends StatelessWidget {
  final List<MedicineSupply> medicineSupplies;

  const MedicinesList({Key key, @required this.medicineSupplies})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Store store = VxState.store;
    return medicineSupplies.isNotEmpty
        ? ListView.builder(
            // separatorBuilder: (context, index) => const Divider(),
            itemCount: medicineSupplies.length,
            itemBuilder: (context, index) {
              final MedicineSupply supply = medicineSupplies[index];
              return Card(
                elevation: 0.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    supply.medicineName.text.xl.semiBold.make(),
                    10.heightBox,
                    MyRichText(title: "Address", value: supply.address),
                    if (supply.cityId != null)
                      MyRichText(
                          title: "City",
                          value: CityMutation.getCity(store, supply.cityId)),
                    MySelectableRichText(
                        title: "Phone", value: supply.phone?.toString()),
                    MySelectableRichText(
                        title: "Alt Phone",
                        value: supply.alternatePhone?.toString()),
                    MyRichText(
                        title: "Submitted",
                        value: Utils.getFormattedTime(supply?.createdAt)),
                    if (!supply.lastVerifiedAt.isEmptyOrNull)
                      [
                        MyRichText(
                            title: "Verified At",
                            value:
                                Utils.getFormattedTime(supply?.lastVerifiedAt)),
                        10.widthBox,
                        Icon(
                          CupertinoIcons.checkmark_seal_fill,
                          color: store.isDarkTheme ? Vx.white : Vx.blue500,
                          size: 16.0,
                        ).centered()
                      ].hStack(crossAlignment: CrossAxisAlignment.center)
                  ],
                ).p16(),
              );
            },
          )
        : NoDataPage();
  }
}
