import 'package:flutter/material.dart';
import 'package:flutter_sample_app/stop_watch.dart';
import 'package:flutter_sample_app/calendar.dart';

void main() {
  runApp(const MyApp());
}

final dateList = makeDateList();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage('Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage(this.title, {Key? key}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: const Text(
            'FlutterExercize',
            style: TextStyle(color: Colors.black),
          )),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text('flutterexercize'),
          CircleWidget(),
          ImageWidget(),
          StopWatchWidget(),
          CalendarWidget(),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        onPressed: () {
          debugPrint('pressed');
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
