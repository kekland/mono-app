import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_tracker/widgets/home_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return new MaterialApp(
      title: 'Mono',
      theme: new ThemeData(
        textTheme: TextTheme(
          title: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: new HomePage(),
    );
  }
}
