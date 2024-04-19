// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pomodoro_app/Pages/home.dart';
import 'package:pomodoro_app/main.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int pomodoroTime = 25;
  int shortBreakTime = 5;
  int longBreakTime = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: 344,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 208, 71, 255),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(220, 223, 223, 223),
                        offset: Offset(2, 2),
                        blurRadius: 12,
                        spreadRadius: 3),
                    BoxShadow(
                        color: Color.fromARGB(220, 223, 223, 223),
                        offset: Offset(2, 2),
                        blurRadius: 12,
                        spreadRadius: 3)
                  ]),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: Text(
                          "Settings",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: "myFont2"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                longBreakTime = 20;
                                shortBreakTime = 5;
                                pomodoroTime = 25;
                              });
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 26,
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Divider(
                    height: 1,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "TIME (MINUTES)",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Pomodoro  ",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 50,
                        width: 124,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                pomodoroTime.toString().padLeft(2, '0'),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            Container(
                              //color: Colors.amber,
                              width: 80,
                              child: Stack(
                                children: [
                                  Positioned(
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              pomodoroTime++;
                                              pomodoroTime %= 60;
                                            });
                                          },
                                          icon: Icon(
                                              color: Colors.white,
                                              Icons.keyboard_arrow_up)),
                                      right: 0,
                                      bottom: 15),
                                  Positioned(
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            pomodoroTime--;
                                          pomodoroTime %= 60;
                                          });
                                        },
                                        icon: Icon(
                                            color: Colors.white,
                                            Icons.keyboard_arrow_down)),
                                    top: 15,
                                    right: 0,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(90, 255, 255, 255)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Short break",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 50,
                        width: 124,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                shortBreakTime.toString().padLeft(2, '0'),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            Container(
                              //color: Colors.amber,
                              width: 80,
                              child: Stack(
                                children: [
                                  Positioned(
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              shortBreakTime++;
                                              shortBreakTime %= 60;
                                            });
                                          },
                                          icon: Icon(
                                              color: Colors.white,
                                              Icons.keyboard_arrow_up)),
                                      right: 0,
                                      bottom: 15),
                                  Positioned(
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            shortBreakTime--;
                                          shortBreakTime %= 60;
                                          });
                                        },
                                        icon: Icon(
                                            color: Colors.white,
                                            Icons.keyboard_arrow_down)),
                                    top: 15,
                                    right: 0,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(90, 255, 255, 255)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Long break ",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 50,
                        width: 124,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                longBreakTime.toString().padLeft(2, '0'),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            Container(
                              //color: Colors.amber,
                              width: 80,
                              child: Stack(
                                children: [
                                  Positioned(
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              longBreakTime++;
                                              longBreakTime %= 60;
                                            });
                                          },
                                          icon: Icon(
                                              color: Colors.white,
                                              Icons.keyboard_arrow_up)),
                                      right: 0,
                                      bottom: 15),
                                  Positioned(
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            longBreakTime--;
                                            longBreakTime %= 60;
                                          });
                                        },
                                        icon: Icon(
                                            color: Colors.white,
                                            Icons.keyboard_arrow_down)),
                                    top: 15,
                                    right: 0,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(90, 255, 255, 255)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    height: 1,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Font",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PomodoroApp(
                              home: Home(
                                pomodoroTime: pomodoroTime,
                                shortBreakTime: shortBreakTime,
                                longBreakTime: longBreakTime,
                              ),
                            ),
                          ));
                    });
                  },
                  icon: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 30,
                  )),
              decoration: BoxDecoration(
                  color: Color.fromARGB(186, 209, 71, 255),
                  borderRadius: BorderRadius.circular(40)),
            )
          ],
        ),
      ),
    );
  }
}
