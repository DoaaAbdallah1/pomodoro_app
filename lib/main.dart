// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:pomodoro_app/Pages/home.dart';
import 'package:pomodoro_app/Pages/setting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        home: PomodoroApp(
          home: Home(longBreakTime: 20, pomodoroTime: 25, shortBreakTime: 5),
        ));
  }
}

class PomodoroApp extends StatefulWidget {
  const PomodoroApp({super.key, required this.home});
  final Home home;
  @override
  State<PomodoroApp> createState() => _PomodoroAppState();
}

class _PomodoroAppState extends State<PomodoroApp> {
  int _page = 0;
  Home homeWidget =
      Home(longBreakTime: 20, pomodoroTime: 25, shortBreakTime: 5);
  List widgetPage = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeWidget = widget.home;
    setState(() {
      widgetPage = [homeWidget, Settings()];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: IconButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PomodoroApp(
                          home: Home(
                            pomodoroTime: 25,
                            shortBreakTime: 5,
                            longBreakTime: 20,
                          ),
                        ),
                      ));
                });
              },
              icon: Icon(
                Icons.refresh,
                size: 28,
                color: Color.fromARGB(255, 208, 71, 255),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Color.fromARGB(24, 95, 95, 95))),
            ),
          )
        ],
        title: Text(
          "  POMODORO",
          style: TextStyle(
              fontSize: 26,
              color: Color.fromARGB(255, 208, 71, 255),
              fontFamily: "myFont"),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Color.fromARGB(255, 208, 71, 255),
        backgroundColor: Colors.white,
        height: 60,
        items: <Widget>[
          Icon(
            Icons.home_outlined,
            size: 25,
            color: Colors.white,
          ),
          Icon(Icons.settings, size: 25, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: widgetPage[_page],
    );
  }
}
