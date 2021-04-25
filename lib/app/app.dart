import 'package:india_beats_covid/store/store.dart';
import 'package:india_beats_covid/themes/theme.dart';
import 'package:india_beats_covid/views/home/home.dart';

import '../pkgs.dart';

class App extends StatelessWidget {
  final _delegate = VxNavigator(routes: {
    "/": (_, __) => MaterialPage(child: Home()),
  });

  @override
  Widget build(BuildContext context) {
    setupNavigator(_delegate);
    return MaterialApp.router(
      routerDelegate: _delegate,
      routeInformationParser: VxInformationParser(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
    );
  }

  void setupNavigator(VxNavigator _delegate) {
    final Store store = VxState.store;
    store.navigator = _delegate;
  }
}
