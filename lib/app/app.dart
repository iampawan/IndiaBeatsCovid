import 'package:india_beats_covid/mutations/theme_mutation.dart';
import 'package:india_beats_covid/utils/themes/theme.dart';
import 'package:india_beats_covid/views/home/home.dart';

import '../pkgs.dart';

class App extends StatelessWidget {
  final _delegate = VxNavigator(routes: {
    "/": (_, __) => MaterialPage(child: Home()),
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
        theme: store.isDarkTheme ? AppTheme.darkTheme() : AppTheme.lightTheme(),
      ),
    );
  }
}
