import 'package:flutter/cupertino.dart';
import 'package:india_beats_covid/core/models/donors.dart';
import 'package:india_beats_covid/mutations/get_apis_mutation.dart';
import 'package:india_beats_covid/utils/utils.dart';
import 'package:india_beats_covid/views/common/my_rich_text.dart';
import 'package:india_beats_covid/views/common/no_data_page.dart';

import '../../pkgs.dart';

class DonorsList extends StatelessWidget {
  final List<Donors> donors;

  const DonorsList({Key key, @required this.donors}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Store store = VxState.store;
    return donors.isNotEmpty
        ? ListView.builder(
            // separatorBuilder: (context, index) => const Divider(),
            itemCount: donors.length,
            itemBuilder: (context, index) {
              final Donors donor = donors[index];
              return Card(
                elevation: 0.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    donor.name.text.xl.semiBold.make(),
                    10.heightBox,
                    MyRichText(title: "Blood Group", value: donor.bloodGroup),
                    MyRichText(title: "Address", value: donor.address),
                    if (donor.cityId != null)
                      MyRichText(
                          title: "City",
                          value: CityMutation.getCity(store, donor.cityId)),
                    MyRichText(
                        title: "Pincode", value: donor.pincode?.toString()),
                    MySelectableRichText(
                        title: "Phone", value: donor.phone?.toString()),
                    MySelectableRichText(
                        title: "Alt Phone",
                        value: donor.alternatePhone?.toString()),
                    MyRichText(
                        title: "Submitted",
                        value: Utils.getFormattedTime(donor?.createdAt)),
                    if (!donor.lastVerifiedAt.isEmptyOrNull)
                      [
                        MyRichText(
                            title: "Verified At",
                            value:
                                Utils.getFormattedTime(donor?.lastVerifiedAt)),
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
