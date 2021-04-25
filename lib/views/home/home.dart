import 'package:india_beats_covid/utils/constants.dart';

import '../../pkgs.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Constants.appName.text.make(),
      ),
    );
  }
}
