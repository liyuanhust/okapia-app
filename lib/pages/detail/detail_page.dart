import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:okapia_app/pages/colors.dart';
import 'package:okapia_app/routers.dart';

class DetailPage extends StatefulWidget {
  final String title;

  const DetailPage({Key key, @required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DetailPageState();
  }
}

const edgeHorizontal = 16.0;

enum _PasswordMenu {
  COPY,
  SHOW,
  EXPAND,
}

class _DetailPageState extends State<DetailPage> {
  static var passwordMenuText = {
    _PasswordMenu.COPY: "复制到剪切板",
    _PasswordMenu.SHOW: "显示密码",
    _PasswordMenu.EXPAND: "展开",
  };

  Widget _buildPasswordMenu() {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) {
        return _PasswordMenu.values
            .map((value) => PopupMenuItem(
                  child: Text(passwordMenuText[value]),
                  value: value,
                ))
            .toList();
      },
      onSelected: (_PasswordMenu value) {
        print(">>>>> value:$value");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("查看密码"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Routers.router.pop(context);
            }),
        actions: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 20),
              child: Text(
                "更新",
                style: TextStyle(color: Color(0xffCB4B16)),
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Divider(height: 1, color: PageColors.colorf5f5f5),
            _buildItem("标题", children: <Widget>[
              Expanded(child: Text(widget.title)),
            ]),
            Divider(height: 1, color: PageColors.colorf5f5f5),
            _buildItem("分类", children: <Widget>[]),
            Divider(height: 1, color: PageColors.colorf5f5f5),
            _buildItem("密码", children: <Widget>[
              Expanded(
                child: Text(
                  "123456678",
                ),
              ),
              _buildPasswordMenu()
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(text, {List<Widget> children = const <Widget>[]}) {
    var rowChildren = [
      Text(text, style: TextStyle(color: Colors.black, fontSize: 16)),
      SizedBox(width: 18),
    ];
    rowChildren.addAll(children);
    return Container(
      alignment: Alignment.center,
      height: 48,
      padding: EdgeInsets.fromLTRB(edgeHorizontal, 0, edgeHorizontal, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: rowChildren,
      ),
    );
  }
}
