import 'package:india_beats_covid/pkgs.dart';

class BottomBarMutation extends VxMutation<Store> {
  final int index;

  BottomBarMutation(this.index);
  @override
  perform() {
    store.selectedIndex = index;
  }
}
