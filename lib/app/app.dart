import 'package:india_beats_covid/mutations/theme_mutation.dart';
import 'package:india_beats_covid/utils/routes.dart';
import 'package:india_beats_covid/utils/themes/theme.dart';
import 'package:india_beats_covid/views/home/home.dart';
import 'package:india_beats_covid/views/hospital/hospital.dart';
import 'package:india_beats_covid/views/plasma/plasma.dart';

import '../pkgs.dart';

class App extends StatelessWidget {
  final _delegate = VxNavigator(routes: {
    Routes.homeRoute: (_, __) => MaterialPage(child: Home()),
    Routes.plasmaRoute: (_, __) => MaterialPage(child: Plasma()),
    Routes.hospitalRoute: (_, __) => MaterialPage(child: Hospital()),
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
