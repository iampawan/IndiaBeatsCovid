import 'package:india_beats_covid/core/mock/mock_data.dart';
import 'package:india_beats_covid/utils/constants.dart';
import 'package:url_launcher/link.dart';

import '../../pkgs.dart';

class TwitterScreen extends StatelessWidget {
  final ValueNotifier<String> keyword = ValueNotifier<String>("");

  @override
  Widget build(BuildContext context) {
    // final Store store = VxState.store;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Constants.twitterSearch.text.xl3.semiBold.center.make(),
        Constants.twitterResources.text.caption(context).center.make(),
        20.heightBox,
        Constants.selectRegion.text.xl.semiBold.center.make(),
        ValueListenableBuilder(
          valueListenable: keyword,
          builder: (context, value, child) {
            return [
              Autocomplete<String>(
                displayStringForOption: (option) => option,
                fieldViewBuilder: (context, textEditingController, focusNode,
                        onFieldSubmitted) =>
                    TextField(
                  controller: textEditingController,
                  focusNode: focusNode,
                  // onEditingComplete: onFieldSubmitted,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Delhi"),
                ),
                optionsBuilder: (textEditingValue) {
                  if (textEditingValue.text == '') {
                    return [];
                  }
                  return cities.where((String option) {
                    return option
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selection) {
                  keyword.value = selection;
                },
              ).p32(),
              Link(
                target: LinkTarget.blank,
                uri: Uri.parse(
                    "https://twitter.com/search?q=verified+${keyword.value}+(bed+OR+beds+OR+icu+OR+oxygen+OR+ventilator+OR+ventilators+OR+fabiflu)+-%22not+verified%22+-%22unverified%22+-%22needed%22+-%22required%22&f=live"),
                builder: (context, followLink) => ElevatedButton(
                  onPressed: followLink,
                  child: Constants.findOnTwitter.text.make(),
                ).h(50),
              )
            ].vStack();
          },
        ),
      ],
    ).hFull(context).centered();
  }
}
