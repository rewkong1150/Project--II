import 'package:GoogleMaps/login.dart';
import 'package:GoogleMaps/providers.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19_App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Longin(),
    );
  }
}
