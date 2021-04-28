import 'package:india_beats_covid/mutations/theme_mutation.dart';
import 'package:india_beats_covid/utils/routes.dart';
import 'package:india_beats_covid/utils/themes/theme.dart';
import 'package:india_beats_covid/views/home/home_screen.dart';
import 'package:india_beats_covid/views/hospital/hospital_screen.dart';
import 'package:india_beats_covid/views/links/link_screen.dart';
import 'package:india_beats_covid/views/oxygen/oxygen_screen.dart';
import 'package:india_beats_covid/views/plasma/plasma_screen.dart';

import '../pkgs.dart';

class App extends StatelessWidget {
  final _delegate = VxNavigator(routes: {
    Routes.homeRoute: (_, __) => MaterialPage(child: HomeScreen()),
    Routes.plasmaRoute: (_, __) => MaterialPage(child: PlasmaScreen()),
    Routes.hospitalRoute: (_, __) => MaterialPage(child: HospitalScreen()),
    Routes.oxygenRoute: (_, __) => MaterialPage(child: OxygenScreen()),
    Routes.linkRoute: (_, __) => MaterialPage(child: LinkScreen()),
  });

  @override
  Widget build(BuildContext context) {
    final Store store = VxState.store;
    store.navigator = _delegate;
    return VxBuilder(
      mutations: {ThemeMutation},
      builder: (context, _) => MaterialApp.router(
        routerDelegate: _delegate,
        routeInformationParser: VxInformationParser(),
        debugShowCheckedModeBanner: false,
        theme: store.isDarkTheme
            ? AppTheme.darkTheme(context)
            : AppTheme.lightTheme(context),
      ),
    );
  }
}
