import 'package:flutter/material.dart';

class InfiniteTabBar extends StatefulWidget {
  final List<String> tabs;
  InfiniteTabBar(this.tabs);
  @override
  _InfiniteTabBarState createState() => _InfiniteTabBarState();
}

class _InfiniteTabBarState extends State<InfiniteTabBar> {
  int currentTab = 0;

  String getTab(int offset) {
    int index = currentTab + offset;
    if (index < 0) {
      return widget.tabs[index + widget.tabs.length];
    } else if (index >= widget.tabs.length) {
      return widget.tabs[index - widget.tabs.length];
    } else {
      return widget.tabs[index];
    }
  }

  moveTab(int direction) {
    setState(() {
      currentTab += direction;
      if (currentTab < 0) {
        currentTab = widget.tabs.length + currentTab;
      } else if (currentTab >= widget.tabs.length) {
        currentTab = currentTab - widget.tabs.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [-1, 0, 1].map((offset) => InfiniteTabBarChild(getTab(offset))).toList(),
      ),
    );
  }
}

class InfiniteTabBarChild extends StatelessWidget {
  final String text;
  InfiniteTabBarChild(this.text);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.purple,
        ),
      ),
    );
  }
}
