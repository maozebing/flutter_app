import 'package:flutter/material.dart';
import 'user.dart';

class EventDetail extends StatefulWidget {
  // 类的构造器，用来接收传递的值
  EventDetail({Key key, this.item}) : super(key: key);
  // 用来储存传递过来的值
  final User item; 

  @override
  State<StatefulWidget> createState() {
    return _EventDetailState();
  }
}

class _EventDetailState extends State<EventDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.item.roadName),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[Text(widget.item.reportout)],
          ),
        ));
  }
}
