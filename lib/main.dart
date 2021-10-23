import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequoiacapdemo/provider_setup.dart';

import 'core/constants/color_constants.dart';
import 'core/helper/navigation_service.dart';
import 'core/locator/locator.dart';
import 'core/preference/preferences.dart';
import 'core/routing/router.dart';
import 'core/routing/routes.dart';
import 'core/viewmodels/network_view_model.dart';

final RouteObserver<PageRoute> routeObserver = new RouteObserver<PageRoute>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  Provider.debugCheckInvalidValueType = null;
  locator<NetworkViewModel>().initListener();
  runApp(const VruumzApp());
}

class VruumzApp extends StatefulWidget {
  const VruumzApp({Key? key}) : super(key: key);

  @override
  _VruumzAppState createState() => _VruumzAppState();
}

class _VruumzAppState extends State<VruumzApp> {
  @override
  void initState() {
    super.initState();
    Preferences.init();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: locator<NavigationService>().navigationKey,
        theme: ThemeData(
          primaryColor: ColorConstants.primaryColor,
          splashColor: Colors.white,
          brightness: Brightness.light,
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: ColorConstants.primaryColor.withOpacity(0.4),
            selectionHandleColor: ColorConstants.primaryColor,
            cursorColor: ColorConstants.primaryColor,
          ),
        ),
        initialRoute: Routes.HomeScreen,
        onGenerateRoute: PageRouter.generateRoute,
      ),
    );
  }
}
