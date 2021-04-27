import 'package:india_beats_covid/core/store.dart';
import 'package:india_beats_covid/pkgs.dart';

class ThemeMutation extends VxMutation<Store> {
  final bool isDarkMode;
  ThemeMutation(this.isDarkMode);
  @override
  perform() {
    store.isDarkTheme = isDarkMode;
  }
}
