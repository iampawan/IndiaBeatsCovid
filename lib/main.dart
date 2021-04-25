import 'package:india_beats_covid/pkgs.dart';
import 'app/app.dart';
import 'pkgs.dart';
import 'store/store.dart';

Future<void> main() async {
  runApp(VxState(
    child: App(),
    store: Store(),
  ));
}
