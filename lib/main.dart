import 'package:flutter/material.dart';
import 'package:wifi_measurement/MeasureReport.dart';
import 'color_schemes.g.dart';

import 'MyHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wifi Measurement',
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      //theme: ThemeData(
      //  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //  useMaterial3: true,
      //),
      home: const MyHomePage(title: 'Wifi Measurement'),
        //MeasureReport(title: 'Wifi Measurement', positionName: 'abc', orientation: '123',)
    );
  }
}


