import 'package:GoogleMaps/chat2/providers/app.dart';
import 'package:GoogleMaps/chat2/providers/auth.dart';
import 'package:GoogleMaps/chat2/screens/authentication.dart';
import 'package:GoogleMaps/chat2/screens/home.dart';
import 'package:GoogleMaps/chat2/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'helper/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization;
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AppProvider()),
        ChangeNotifierProvider.value(value: AuthProvider.init()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat room',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AppScreensController(),
      )));
}

class AppScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    switch (authProvider.status) {
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return AuthenticationScreen();
      case Status.Authenticated:
        return HomeScreen();
      default:
        return AuthenticationScreen();
    }
  }
}
