import 'package:india_beats_covid/pkgs.dart';
import 'package:india_beats_covid/store/store.dart';

class ThemeMutation extends VxMutation<Store> {
  final bool isDarkMode;
  ThemeMutation(this.isDarkMode);
  @override
  perform() {
    store.isDarkTheme = isDarkMode;
  }
}
