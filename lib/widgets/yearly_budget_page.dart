import 'package:flutter/material.dart';
import 'package:money_tracker/widgets/tabbar/infinite_tabbar.dart';

class YearlyBudgetPage extends StatefulWidget {
  @override
  _YearlyBudgetPageState createState() => _YearlyBudgetPageState();
}

List<String> months = [
  'January',
  'Febuary',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

class _YearlyBudgetPageState extends State<YearlyBudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfiniteTabBar(
          months,
        ),
      ],
    );
  }
}
