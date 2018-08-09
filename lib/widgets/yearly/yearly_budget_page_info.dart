import 'dart:math';

import 'package:flutter/material.dart';
import 'package:money_tracker/widgets/yearly/yearly_budget_page.dart';

class YearlyBudgetPageInfoWidget extends StatefulWidget {
  final MonthData data;

  YearlyBudgetPageInfoWidget(this.data);
  @override
  _YearlyBudgetPageInfoWidgetState createState() => _YearlyBudgetPageInfoWidgetState();
}

class _YearlyBudgetPageInfoWidgetState extends State<YearlyBudgetPageInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: <Widget>[
            Text(
              widget.data.monthName,
              style: TextStyle(
                fontFamily: 'Futura',
                fontSize: 36.0,
                color: Colors.white70,
              ),
            ),
            Text(
              '${300}\$',
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Futura',
                color: Colors.white,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  'Clothing',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: 'Futura',
                  ),
                ),
                Text(
                  'Most spent on',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Car',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: 'Futura',
                  ),
                ),
                Text(
                  'Least spent on',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
