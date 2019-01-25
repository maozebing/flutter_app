import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> strItems = <String>[
      '图标 -> keyboard',
      '图标 -> print',
      '图标 -> router',
      '图标 -> pages',
      '图标 -> zoom_out_map',
      '图标 -> zoom_out',
      '图标 -> youtube_searched_for',
      '图标 -> wifi_tethering',
      '图标 -> wifi_lock',
      '图标 -> widgets',
      '图标 -> weekend',
      '图标 -> web',
      '图标 -> accessible',
      '图标 -> ac_unit',
    ];

    List<Icon> iconItems = <Icon>[
      new Icon(Icons.keyboard),
      new Icon(Icons.print),
      new Icon(Icons.router),
      new Icon(Icons.pages),
      new Icon(Icons.zoom_out_map),
      new Icon(Icons.zoom_out),
      new Icon(Icons.youtube_searched_for),
      new Icon(Icons.wifi_tethering),
      new Icon(Icons.wifi_lock),
      new Icon(Icons.widgets),
      new Icon(Icons.weekend),
      new Icon(Icons.web),
      new Icon(Icons.accessible),
      new Icon(Icons.ac_unit),
    ];

    void _getHttp() async {
      try {
        Dio dio = new Dio();
        Response response = await dio
            .get("http://app.gstscc.cn:9011/api/roadCondition/info/bursts");
        return print(response.data.toString());
      } catch (e) {
        return print(e);
      }
    }

    Widget buildListData(BuildContext context, String strItem, Icon iconItem) {
      return new ListTile(
        isThreeLine: false,
        leading: iconItem,
        title: new Text(strItem),
        trailing: new Icon(Icons.keyboard_arrow_right),
        onTap: () {
          _getHttp();

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return new AlertDialog(
                title: new Text(
                  'ListViewDemo',
                  style: new TextStyle(
                    color: Colors.black54,
                    fontSize: 18.0,
                  ),
                ),
                content: new Text('您选择的item内容为:$strItem'),
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
    return Scaffold(
      appBar: AppBar(
        title: Text('我的待办'),
      ),
      body: Container(
        child: ListView.separated(
          itemCount: iconItems.length,
          //列表项构造器
          itemBuilder: (BuildContext context, int index) {
            return buildListData(context, strItems[index], iconItems[index]);
          },
          //分割器构造器
          separatorBuilder: (BuildContext context, int index) {
            return divider1;
          },
        ),
      ),
    );
  }
}
