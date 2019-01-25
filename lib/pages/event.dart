import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../model/event.dart';
import 'eventDetail.dart';

class EventListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('实时路况'),
        //backgroundColor: Color.fromRGBO(237, 237, 237, 1),
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
  var _members = <Event>[];
  void _getDatas() async {
    Dio dio = new Dio();
    Response response = await dio
        .get("http://app.gstscc.cn:9011/api/roadCondition/info/bursts");
    setState(() {
      for (var memberJSON in response.data) {
        final member =
            new Event(memberJSON["roadName"], memberJSON["reportout"],"12:35");
        _members.add(member);
      }

      debugPrint(_members.length.toString());
    });
  }

  _showDialog(item) {
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
  }

  _showEventDetail(item) {
    //导航到新路由
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return new EventDetail(item: item);
    }));
  }

  Widget buildListData(BuildContext context, Event item) {
    debugPrint(item.roadName);
    debugPrint(item.reportout);
    return ListTile(
      isThreeLine: false,
      title: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                item.roadName,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
            flex: 5,
          ),
          Expanded(
            child: Container(
              child: Text(
                item.time,
                textAlign: TextAlign.right,
              ),
            ),
            flex: 1,
          ),
        ],
      ),
      subtitle:
          Text(item.reportout, maxLines: 2, overflow: TextOverflow.ellipsis),
      //trailing: Text("23:00"),
      onTap: () {
        _showEventDetail(item);
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
