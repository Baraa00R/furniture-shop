import 'package:flutter/material.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/screens/drawer/date.dart';
import 'package:stylish/screens/drawer/drawer.dart';
import 'package:stylish/screens/drawer/useraccount.dart';
import 'package:stylish/screens/home/components/loginPage.dart';
import 'package:stylish/screens/home/components/welcoming.dart';
import 'package:stylish/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        primarySwatch: Colors.blue,
        fontFamily: "Gordita",
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      
      home: welcoming(),
    );
  }
}
