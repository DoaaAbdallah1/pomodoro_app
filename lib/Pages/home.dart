// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

int pomodoroTimeVar = 25;
int shortTimeVar = 5;
int longTimeVar = 20;

class Home extends StatefulWidget {
  const Home({
    required this.longBreakTime,
    required this.pomodoroTime,
    required this.shortBreakTime,
  });

  final int longBreakTime;
  final int shortBreakTime;
  final int pomodoroTime;

  @override
  State<Home> createState() => _HomeState();
}

class Task {
  String title;
  bool status;
  Task({
    required this.title,
    required this.status,
  });
}

class _HomeState extends State<Home> {
  bool paly = false;

  Duration initTime = Duration(minutes: 0);
  int oldTime = 0;
  Timer? repeatEvent;

  List myList = [
    Task(title: "Short Break", status: false),
    Task(title: "Pomodoro", status: false),
    Task(title: "Long Break", status: false),
  ];
  changeStatus(int index) {
    setState(() {
      myList[index].status = !myList[index].status;
      for (var i = 0; i < 3; i++) {
        if (i != index) {
          myList[i].status = false;
        }
      }
    });
  }

  changeTime() {
    repeatEvent = Timer.periodic(Duration(milliseconds: 1), (timer) {
      setState(() {
        initTime = initTime - Duration(seconds: 1);

        if (initTime.inSeconds == 0) {
          paly = false;
          if (myList[2].status) {
            initTime = Duration(minutes: widget.longBreakTime);
          }
          if (myList[1].status) {
            initTime = Duration(minutes: widget.pomodoroTime);
          }
          if (myList[0].status) {
            initTime = Duration(minutes: widget.shortBreakTime);
          }
          if (timer.isActive) {
            timer.cancel();
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 208, 71, 255),
                  borderRadius: BorderRadius.circular(500),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(220, 223, 223, 223),
                        offset: Offset(3, 2),
                        blurRadius: 12,
                        spreadRadius: 3),
                    BoxShadow(
                        color: Color.fromARGB(220, 223, 223, 223),
                        offset: Offset(2, 3),
                        blurRadius: 12,
                        spreadRadius: 3)
                  ]),
              padding: EdgeInsets.all(15),
              child: CircularPercentIndicator(
                radius: 100.0,
                center: Text(
                  initTime.inSeconds == 0
                      ? "00:00"
                      : "${initTime.inMinutes.toString().padLeft(2, '0')}:${initTime.inSeconds.remainder(60).toString().padLeft(2, '0')}",
                  style: TextStyle(
                      fontSize: 40, color: Colors.white, fontFamily: "myFont3"),
                ),
                progressColor: Colors.white,
                backgroundColor: const Color.fromARGB(0, 158, 158, 158),
                lineWidth: 8.0,
                percent: initTime.inSeconds == 0
                    ? 1
                    : initTime.inMinutes.toDouble() / oldTime.toDouble(),
                animation: true,
                animateFromLastPercent: true,
                animationDuration: 250,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 300,
                    height: 80,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: myList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    changeStatus(index);
                                    setState(() {
                                      if (myList[2].status) {
                                        initTime = Duration(
                                            minutes: widget.longBreakTime);
                                        oldTime = widget.longBreakTime;
                                      }
                                      if (myList[1].status) {
                                        initTime = Duration(
                                            minutes: widget.pomodoroTime);
                                        oldTime = widget.pomodoroTime;
                                      }
                                      if (myList[0].status) {
                                        initTime = Duration(
                                            minutes: widget.shortBreakTime);
                                        oldTime = widget.shortBreakTime;
                                      }
                                      if (!(myList[0].status ||
                                          myList[1].status ||
                                          myList[2].status)) {
                                        initTime = Duration(seconds: 0);
                                        oldTime = 0;
                                      }

                                      if (repeatEvent!.isActive) {
                                        repeatEvent!.cancel();
                                      }
                                      paly = false;
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        myList[index].title,
                                        style: TextStyle(
                                          color: myList[index].status
                                              ? Color.fromARGB(
                                                  255, 208, 71, 255)
                                              : Color.fromARGB(95, 0, 0, 0),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        height: 6,
                                        width: 78,
                                        decoration: BoxDecoration(
                                            color: myList[index].status
                                                ? Color.fromARGB(
                                                    255, 208, 71, 255)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      )
                                    ],
                                  )),
                            ],
                          );
                        })),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      paly ? paly = false : paly = true;
                      if (initTime.inSeconds == 0) {
                        paly = false;
                      }
                      if (paly) {
                        changeTime();
                      } else {
                        if (repeatEvent!.isActive) {
                          repeatEvent!.cancel();
                        }
                      }
                    });
                  },
                  icon: Icon(
                    paly ? Icons.pause : Icons.play_arrow,
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
