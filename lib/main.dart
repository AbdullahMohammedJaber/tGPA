import 'package:flutter/material.dart';
import 'package:t_gpa/home.dart';
import 'package:t_gpa/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'gpa calc',
        home: home(),
        routes: {"result": (context) => result()},
        theme: ThemeData());
  }
}
