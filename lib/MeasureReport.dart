import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:wifi_measurement/ReportData.dart';

class MeasureReport extends StatelessWidget {
  MeasureReport({super.key, required this.title, required this.positionName, required this.orientation});

  final String title;
  final String positionName;
  final String orientation;

  final testList = List.generate(4, (index) => ReportData("testid", 123));

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Text(title),
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
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    children: <Widget>[
                      Text("Position: $positionName"),
                      const SizedBox(height: 15.0,),
                      Text("Orientation: $orientation"),
                      const SizedBox(height: 15.0,),
                      const Text("Scan Results:"),
                      const SizedBox(height: 15.0,),
                      ListView.builder(
                        itemCount: testList.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: <Widget>[
                              Text(testList[index].bssId),
                              Text(testList[index].signalStrength.toString()),
                            ],
                          );
                        },
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                      )
                    ])
            ),
          ],
        ),
      ),
    );
  }

}