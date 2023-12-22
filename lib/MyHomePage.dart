import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:flutter/services.dart';
import 'dart:async';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('roygao.cn/sensor');
  static const eventChannel = EventChannel('roygao.cn/orientationEvent');
  final positionNameController = TextEditingController();
  final orientationController = TextEditingController();

  Stream<String> streamOrientationFromNative() {
    return eventChannel
        .receiveBroadcastStream()
        .map((event) => event.toString());
  }

  @override
  void initState() {
    eventChannel.receiveBroadcastStream().listen((message) {
      // Handle incoming message
      setState(() {
        orientationController.text = message;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Image(image: AssetImage('images/wifi_location.jpg')),
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    children: <Widget>[
                      TextField(
                        controller: positionNameController,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Indoor position name',
                        ),
                      ),
                      const SizedBox(height: 15.0,),
                      TextField(
                        controller: orientationController,
                        obscureText: false,
                        enabled: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Orientation in degrees',
                        ),
                      ),
                      const SizedBox(height: 15.0,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: theme.colorScheme.primary,
                          elevation: 0,
                        ),
                        onPressed: () {},
                        child: Text(
                          "Measure", style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.onPrimary,
                        ),),
                      ),
                    ])
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    positionNameController.dispose();
    orientationController.dispose();
    super.dispose();
  }
}