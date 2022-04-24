import 'package:flutter/material.dart';
import 'package:linkar/homepage.dart';
import 'package:linkar/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Linkar', debugShowCheckedModeBanner: false, home: homepage());
  }
}
