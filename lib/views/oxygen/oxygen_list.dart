import 'package:flutter/cupertino.dart';
import 'package:india_beats_covid/core/models/oxygen_suppliers.dart';
import 'package:india_beats_covid/mutations/get_apis_mutation.dart';
import 'package:india_beats_covid/utils/utils.dart';
import 'package:india_beats_covid/views/common/my_rich_text.dart';
import 'package:india_beats_covid/views/common/no_data_page.dart';

import '../../pkgs.dart';

class OxygenList extends StatelessWidget {
  final List<OxygenSupplier> suppliers;

  const OxygenList({Key key, @required this.suppliers}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Store store = VxState.store;
    return suppliers.isNotEmpty
        ? ListView.builder(
            // separatorBuilder: (context, index) => const Divider(),
            itemCount: suppliers.length,
            itemBuilder: (context, index) {
              final OxygenSupplier supplier = suppliers[index];
              return Card(
                elevation: 0.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    supplier.name.text.xl.semiBold.make(),
                    10.heightBox,
                    MyRichText(title: "Address", value: supplier.address),
                    if (supplier.cityId != null)
                      MyRichText(
                          title: "City",
                          value: CityMutation.getCity(store, supplier.cityId)),
                    MySelectableRichText(
                        title: "Phone", value: supplier.phone?.toString()),
                    MySelectableRichText(
                        title: "Alt Phone",
                        value: supplier.alternatePhone?.toString()),
                    MyRichText(
                        title: "Submitted",
                        value: Utils.getFormattedTime(supplier?.createdAt)),
                    if (!supplier.lastVerifiedAt.isEmptyOrNull)
                      [
                        MyRichText(
                            title: "Verified At",
                            value: Utils.getFormattedTime(
                                supplier?.lastVerifiedAt)),
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
