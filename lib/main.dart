import 'package:flutter/material.dart';
import 'package:money_tracker/widgets/home_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Mono',
      theme: new ThemeData(
      ),
      home: new HomePage(),
    );
  }
}