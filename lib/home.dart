// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

var grade = "";

class _homeState extends State<home> {
  static int counter = 0;
  static var GPA = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GPA Calculator"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            for (var i = 0; i <= counter; i++) faild.select(),
            faild.select(),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                  child: Icon(Icons.add)),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    GPA = calcGpa.getGPA();
                    //  Navigator.of(context).pushNamed("result");
                  });
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: Column(
                            children: [
                              Text("Your GPA is $GPA"),
                            ],
                          ),
                        );
                      });
                },
                child: Text("The GPA"))
          ],
        ));
  }
}

// ignore: camel_case_types
class faild {
  // ignore: dead_code

  static select() {
    calcGpa tst = new calcGpa();
    var hour = 0;

    int i = 0;
    int j = 0;
    return Column(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "hours",
                ),
                keyboardType: TextInputType.number,
                maxLength: 1,
                onChanged: (value) {
                  hour = int.parse(value);
                  tst.gethour(hour, i);
                  i++;
                },
              ),
            ),
            /* Container(
                margin: EdgeInsets.all(15),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "the grade",
                  ),
                  keyboardType: TextInputType.text,
                  maxLength: 1,
                  controller: gradec,
                  onChanged: (valgrade) {
                //  print(gradec.text.toUpperCase());
                
                       grade=valgrade.toUpperCase();
                       tst.getgrade(grade, j);
                       j++;
                  },
                ),
              )*/
            Container(
                width: double.infinity,
                child: DropdownButton(
                  items:
                      ["A", "A-", "B+", "B", "B- ", "C+", "C", " C-", "D+", "D"]
                          // ignore: unnecessary_string_interpolations
                          .map((e) => DropdownMenuItem(
                                child: Text("${e}"),
                                value: e,
                              ))
                          .toList(),
                  onChanged: (valgrade) {
                    // ignore: unused_element

                    grade = valgrade.toString();
                    tst.getgrade(grade, j);
                    j++;
                  },
                )),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ],
    );
  }
}

class calcGpa {
  var hour2 = List.filled(10, 0);
  var grade2 = List.filled(10, 0.0);
  var i = 0;
  var j = 0;
  var temp = "";
  static var sumhour = 0;
  static var sumgrade = 0.0;
  // static var GPA = 0.0;

  gethour(int hour, int i) {
    this.i = i;
    hour2[i] = hour;
    sumhour += hour2[i];

    if (i >= 1 && hour2[i] == hour2[i - 1]) {
      sumhour -= hour2[i];
    } else if (i >= 1 && hour2[i] != hour2[i - 1]) {
      // print("${hour2[i]} +  ${hour2[i-1]}");
      sumhour -= hour2[i - 1];
    }

    if (i >= 1 && hour2[i] != hour2[i - 1] && grade2[j] != 0) {
      sumgrade += hour2[i] * grade2[j] - hour2[i - 1] * grade2[j];
    }
    if (grade2[j] != 0 && i == 0) {
      getgrade(temp, j);
    }
    printt();
  }

  getgrade(String grade, int j) {
    this.j = j;
    temp = grade;
    grade2[j] = degree(grade);
    sumgrade += hour2[i] * grade2[j];

    if (j >= 1 && grade2[j] == grade2[j - 1]) {
      sumgrade -= hour2[i] * grade2[j];
    } else if (j >= 1 &&
        grade2[j] != grade2[j - 1] &&
        (i >= 1 && hour2[i] == hour2[i - 1] || i == 0)) {
      sumgrade -= hour2[i] * grade2[j - 1];
    } else if (j >= 1 &&
        grade2[j] != grade2[j - 1] &&
        i >= 1 &&
        hour2[i] != hour2[i - 1]) {
      sumgrade -= hour2[i] * grade2[j - 1];
      //  print("${grade2[j]} + ${hour2[i]}");
    }

    printt();
  }

  static int getSumHour() {
    return sumhour;
  }

  static double getSumGrade() {
    return sumgrade;
  }

  static double getGPA() {
    double GPA = 0;
    GPA = sumgrade / sumhour;
    return GPA;
  }

  printt() {
    print(sumhour);
    print(sumgrade);
  }

  static double degree(Object val) {
    if (val.toString().endsWith("A") == true) {
      return 4.00;
    } else if (val.toString().endsWith("A-") == true) {
      return 3.666;
    } else if (val.toString().endsWith("B+") == true) {
      return 3.333;
    } else if (val.toString().endsWith("B") == true) {
      return 3.000;
    } else if (val.toString().endsWith("B- ") == true) {
      return 2.666;
    } else if (val.toString().endsWith("C+") == true) {
      return 2.333;
    } else if (val.toString().endsWith("C") == true) {
      return 2.000;
    } else if (val.toString().startsWith(" C-") == true) {
      return 1.666;
    } else if (val.toString().endsWith("D+") == true) {
      return 1.333;
    } else if (val.toString().endsWith("D") == true) {
      return 1.000;
    }
    return 0.00;
  }
}
