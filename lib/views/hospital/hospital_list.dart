import 'package:flutter/cupertino.dart';
import 'package:india_beats_covid/core/models/hospital_beds.dart';
import 'package:india_beats_covid/mutations/get_apis_mutation.dart';
import 'package:india_beats_covid/utils/utils.dart';
import 'package:india_beats_covid/views/common/my_rich_text.dart';
import 'package:india_beats_covid/views/common/no_data_page.dart';

import '../../pkgs.dart';

class HospitalList extends StatelessWidget {
  final List<HospitalBeds> beds;

  const HospitalList({Key key, @required this.beds}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Store store = VxState.store;
    return beds.isNotEmpty
        ? ListView.builder(
            // separatorBuilder: (context, index) => const Divider(),
            itemCount: beds.length,
            itemBuilder: (context, index) {
              final HospitalBeds bed = beds[index];
              return Card(
                elevation: 0.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bed.hospitalName.text.xl.semiBold.make(),
                    10.heightBox,
                    MyRichText(
                      title: "ICU Covid Beds",
                      value: bed.icuBeds.toString(),
                      isImportant: true,
                    ),
                    MyRichText(
                      title: "Oxygen Beds",
                      value: bed.beds.toString(),
                      isImportant: true,
                    ),
                    MyRichText(title: "Address", value: bed.address),
                    if (bed.cityId != null)
                      MyRichText(
                          title: "City",
                          value: CityMutation.getCity(store, bed.cityId)),
                    MyRichText(title: "Contact Name", value: bed.contactName),
                    MySelectableRichText(
                        title: "Phone", value: bed.phone?.toString()),
                    MySelectableRichText(
                        title: "Alt Phone",
                        value: bed.alternatePhone?.toString()),
                    MyRichText(
                        title: "Submitted",
                        value: Utils.getFormattedTime(bed?.createdAt)),
                    if (!bed.lastVerifiedAt.isEmptyOrNull)
                      [
                        MyRichText(
                            title: "Verified At",
                            value: Utils.getFormattedTime(bed?.lastVerifiedAt)),
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
