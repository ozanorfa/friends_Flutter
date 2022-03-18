import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:panpisler_voices/models/panpis_model.dart';
import 'package:panpisler_voices/splashScreen/splash.dart';
import 'package:panpisler_voices/util/constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => PanpisModelProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          primarySwatch: Colors.blue,
          primaryTextTheme:
              TextTheme(headline6: TextStyle(color: Colors.white))),
      home: MyHomePage(title: 'Hoşgeldiniz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: SplashScreen(),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
