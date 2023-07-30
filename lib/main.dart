import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hockguan/pages/hilang.dart';
import 'pages/login.dart';
import 'pages/home.dart';
import 'pages/googlemap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HilangPage(),
    );
  }
}
