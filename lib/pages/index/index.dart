import 'package:flutter/material.dart';
import 'package:okapia_app/pages/index/list_item.dart';
import 'package:okapia_app/pages/index/list_title.dart';
import 'package:okapia_app/routers.dart';
import 'package:okapia_app/themes/index.dart';

class IndexPage extends StatelessWidget {
  final String title;

  IndexPage({this.title = "Okapia"});

  final List<String> listItems = [
    "支付宝密码",
    "淘宝账号密码",
    "建设银行网银",
    "QQ密码",
    "支付宝密码",
    "淘宝账号密码",
    "建设银行网银",
    "QQ密码",
    "支付宝密码",
    "淘宝账号密码",
    "建设银行网银",
    "QQ密码"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: <Widget>[
          ListTitle(title: "我的全部密码 (${listItems.length})"),
          buildContainerList(),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      elevation: 0.0,
      textTheme: Themes.appBarTextTheme,
      iconTheme: IconThemeData(color: Color.fromRGBO(170, 170, 170, 1)),
      leading: IconButton(
          icon: Icon(Icons.search),
          iconSize: 30.0,
          onPressed: () => Routers.jumpToIndexSearchPage(context)),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.more_vert),
          iconSize: 30.0,
          onPressed: () => print("more"),
        )
      ],
    );
  }

  Expanded buildContainerList() {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: listItems.length,
          itemBuilder: (BuildContext context, int index) {
            return ListItem(
              title: listItems[index],
              onTap: () {
                print("onTap");
              },
            );
          }),
    );
  }
}
