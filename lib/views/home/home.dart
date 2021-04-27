import 'package:india_beats_covid/mutations/get_apis_mutation.dart';
import 'package:india_beats_covid/utils/constants.dart';
import 'package:india_beats_covid/views/home/theme_button.dart';

import '../../pkgs.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    loadAllAPIs();
  }

  @override
  Widget build(BuildContext context) {
    final Store store = VxState.store;
    return Scaffold(
      appBar: AppBar(
        title: Constants.appName.text.make(),
        actions: [ThemeButton()],
      ),
      body: VStack(
        [
          VxBuilder(
              builder: (context, status) {
                if (status == VxStatus.none) {
                  print("loaded");
                  return CircularProgressIndicator().centered();
                } else if (status == VxStatus.success) {
                  return Text(store.stats.hospitalBeds.total.toString());
                } else if (status == VxStatus.error) {
                  return Text("error");
                }
                return Text("");
              },
              mutations: {StatsMutation})
        ],
        crossAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
