import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_app/pages/user.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('突发事件'),
      ),
      body: Container(child: ListPageBody()),
    );
  }
}

class ListPageBody extends StatefulWidget {
  @override
  createState() => ListPageBodyState();
}

class ListPageBodyState extends State<ListPageBody> {
  var _members = <User>[];
  void _getDatas() async {
    Dio dio = new Dio();
    Response response = await dio
        .get("http://app.gstscc.cn:9011/api/roadCondition/info/bursts");
    setState(() {
      for (var memberJSON in response.data) {
        final member =
            new User(memberJSON["roadName"], memberJSON["reportout"]);
        _members.add(member);
      }

      debugPrint(_members.length.toString());
    });
  }

  Widget buildListData(BuildContext context, User item) {
    debugPrint(item.roadName);
    debugPrint(item.reportout);
    return ListTile(
      isThreeLine: false,
      title: Text(item.roadName),
      subtitle: Text(item.reportout),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return new AlertDialog(
              title: Text(
                'ListViewDemo',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              ),
              content: Text('您选择的item内容为:${item.roadName}'),
            );
          },
        );
      },
    );
  }

  //下划线widget预定义以供复用。
  Widget divider1 = Divider(
    color: Colors.blue,
  );

  @override
  // TODO: implement widget
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.separated(
          itemCount: _members.length,
          //列表项构造器
          itemBuilder: (BuildContext context, int index) {
            return buildListData(context, _members[index]);
          },
          //分割器构造器
          separatorBuilder: (BuildContext context, int index) {
            return divider1;
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getDatas();
  }
}
