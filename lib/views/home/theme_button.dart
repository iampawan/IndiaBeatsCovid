import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:india_beats_covid/mutations/theme_mutation.dart';
import 'package:india_beats_covid/pkgs.dart';

class ThemeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Store store = VxState.store;
    VxState.watch(context, on: [ThemeMutation]);
    return GestureDetector(
      onTap: () => ThemeMutation(store.isDarkTheme.toggle()),
      child: Icon(
        store.isDarkTheme ? Ionicons.ios_bulb : Ionicons.ios_moon,
      ).p16(),
    );
  }
}
