import 'package:flutter/cupertino.dart';
import 'package:india_beats_covid/mutations/get_apis_mutation.dart';
import 'package:india_beats_covid/utils/constants.dart';
import 'package:india_beats_covid/views/common/error_page.dart';

import '../../pkgs.dart';
import 'medicines_list.dart';

class MedicineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MedicinesMutation();
    final Store store = VxState.store;
    return Scaffold(
      appBar: AppBar(
        title: Constants.medicineSuppliers.text.xl2.semiBold.make(),
      ),
      body: VxBuilder(
          builder: (context, status) {
            if (status == VxStatus.none) {
              print("loaded");
              return const CupertinoActivityIndicator().centered();
            } else if (status == VxStatus.success) {
              return MedicinesList(medicineSupplies: store.medicineSupplies);
            } else if (status == VxStatus.error) {
              return ErrorPage();
            }
            return Constants.wentWrong.text.xl2.semiBold.makeCentered();
          },
          mutations: {MedicinesMutation}),
    );
  }
}
