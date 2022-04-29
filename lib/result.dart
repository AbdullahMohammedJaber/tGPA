import 'package:flutter/material.dart';
import 'package:t_gpa/home.dart';

class result extends StatefulWidget {
  result({Key key}) : super(key: key);

  @override
  State<result> createState() => _resultState();
}

class _resultState extends State<result> {
  double GPA = calcGpa.getGPA();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [Text("GPA is = $GPA")],
        ),
      ),
    );
  }
}
