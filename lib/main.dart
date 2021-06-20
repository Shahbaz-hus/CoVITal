import 'package:covidpital/Home.dart';
import 'package:covidpital/login.dart';
import 'package:covidpital/registrationFailedPage.dart';
import 'package:covidpital/signUp.dart';
import 'package:covidpital/signUp2.dart';
import 'package:covidpital/test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool check = false;
  getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      check = prefs.getBool('loggedIn');
    });
  }

  @override
  void initState() {
    getLoginStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covital',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: (check == false)
          ? LoginPage()
          : (check == null) ? LoginPage() : HomePage(),
    );
  }
}
