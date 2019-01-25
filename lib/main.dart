import 'package:flutter/material.dart';
import 'package:flutter_app/pages/listPage1.dart';
import 'package:flutter_app/pages/settingPage.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "我的工作", home: BottomNavigationWidget());
  }
}

class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  List<Widget> pages = List<Widget>();
  int _currentIndex = 0;

  @override
  void initState() {
    pages
      ..add(ListPage())
      ..add(SettingPage());
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.category), title: new Text('待办')),
            BottomNavigationBarItem(
                icon: new Icon(Icons.account_circle), title: new Text('我')),
          ],
          //设置当前的索引
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
