import 'package:flutter/material.dart';
import 'package:money_tracker/widgets/yearly_budget_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: YearlyBudgetPage(),
      ),
    );
  }
}