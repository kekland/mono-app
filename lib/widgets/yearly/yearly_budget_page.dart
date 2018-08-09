import 'dart:async';

import 'package:flutter/material.dart';
import 'package:money_tracker/widgets/page_dragger.dart';
import 'package:money_tracker/widgets/yearly/yearly_budget_page_info.dart';

class YearlyBudgetPage extends StatefulWidget {
  @override
  _YearlyBudgetPageState createState() => _YearlyBudgetPageState();
}

List<MonthData> months = [
  MonthData(
    monthName: 'January',
    gradient: [
      Colors.indigo,
      Colors.blue,
    ],
  ),
  MonthData(
    monthName: 'Febuary',
    gradient: [
      Colors.blue,
      Colors.cyan,
    ],
  ),
  MonthData(
    monthName: 'March',
    gradient: [
      Colors.cyan,
      Colors.teal,
    ],
  ),
  MonthData(
    monthName: 'April',
    gradient: [
      Colors.teal,
      Colors.lime,
    ],
  ),
  MonthData(
    monthName: 'May',
    gradient: [
      Colors.lime,
      Colors.lightGreen,
    ],
  ),
  MonthData(
    monthName: 'June',
    gradient: [
      Colors.lightGreen,
      Colors.green,
    ],
  ),
  MonthData(
    monthName: 'July',
    gradient: [
      Colors.green,
      Colors.lime,
    ],
  ),
  MonthData(
    monthName: 'August',
    gradient: [
      Colors.lime,
      Colors.amber,
    ],
  ),
  MonthData(
    monthName: 'September',
    gradient: [
      Colors.amber,
      Colors.deepOrange,
    ],
  ),
  MonthData(
    monthName: 'October',
    gradient: [
      Colors.deepOrange,
      Colors.red,
    ],
  ),
  MonthData(
    monthName: 'November',
    gradient: [
      Colors.red,
      Colors.pink,
    ],
  ),
  MonthData(
    monthName: 'December',
    gradient: [
      Colors.pink,
      Colors.indigo,
    ],
  ),
];

class _YearlyBudgetPageState extends State<YearlyBudgetPage> with TickerProviderStateMixin {
  StreamController<SlideUpdate> slideUpdateStream;
  AnimatedPageDragger dragger;

  int activeIndex = 0;
  int nextPageIndex = 1;
  SlideDirection slideDirection = SlideDirection.none;
  double slidePercent = 0.0;

  _YearlyBudgetPageState() {
    slideUpdateStream = new StreamController<SlideUpdate>();

    slideUpdateStream.stream.listen((SlideUpdate event) {
      setState(() {
        if (event.updateType == UpdateType.dragging) {
          slideDirection = event.slideDirection;
          slidePercent = event.slidePercent;

          if (slideDirection == SlideDirection.leftToRight) {
            nextPageIndex = activeIndex - 1;
          } else if (slideDirection == SlideDirection.rightToLeft) {
            nextPageIndex = activeIndex + 1;
          } else {
            nextPageIndex = activeIndex;
          }
          nextPageIndex.clamp(0, months.length - 1);
        } else if (event.updateType == UpdateType.doneDragging) {
          if (slidePercent > 0.5) {
            dragger = new AnimatedPageDragger(
              slideDirection: slideDirection,
              slidePercent: slidePercent,
              transitionGoal: TransitionGoal.open,
              slideUpdateStream: slideUpdateStream,
              vsync: this,
            );
          } else {
            dragger = new AnimatedPageDragger(
              slideDirection: slideDirection,
              slidePercent: slidePercent,
              transitionGoal: TransitionGoal.close,
              slideUpdateStream: slideUpdateStream,
              vsync: this,
            );

            nextPageIndex = activeIndex;
          }
          dragger.run();
        } else if (event.updateType == UpdateType.animating) {
          slideDirection = event.slideDirection;
          slidePercent = event.slidePercent;
        } else if (event.updateType == UpdateType.doneAnimating) {
          activeIndex = nextPageIndex;
          slideDirection = SlideDirection.none;
          slidePercent = 0.0;
          dragger.dispose();
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.lerp(months[activeIndex].gradient[0], months[nextPageIndex].gradient[0], slidePercent),
                Color.lerp(months[activeIndex].gradient[1], months[nextPageIndex].gradient[1], slidePercent),
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
          ),
        ),
        Opacity(
          opacity: 1.0 - slidePercent,
          child: YearlyBudgetPageInfoWidget(months[activeIndex]),
        ),
        Opacity(
          opacity: slidePercent,
          child: YearlyBudgetPageInfoWidget(months[nextPageIndex]),
        ),
        PageDragger(
          slideUpdateStream: slideUpdateStream,
          canDragLeftToRight: activeIndex > 0,
          canDragRightToLeft: activeIndex < months.length - 1,
        ),
      ],
    );
  }
}

class MonthData {
  String monthName;
  List<Color> gradient;

  MonthData({this.monthName, this.gradient});
}
