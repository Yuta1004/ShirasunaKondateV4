import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
    @override
    _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(
                    "白砂寮献立アプリ+",
                    style: TextStyle(fontWeight: FontWeight.bold)
                ),
                actions: <Widget> [
                    IconButton(
                        icon: Icon(Icons.add_to_home_screen),
                        tooltip: "欠食システムを開く",
                        onPressed: () {},
                    ),
                    IconButton(
                        icon: Icon(Icons.help_outline),
                        tooltip: "ヘルプを見る",
                        onPressed: () {},
                    ),
                ],
            ),
            body: Column(
                children: <Widget> [
                    Expanded(
                        flex: 5,
                        child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text(
                                "0000年00月00日 (月)",
                                style: TextStyle(fontSize: 30),
                            ),
                        ),
                    ),
                    Divider(
                        color: Colors.grey[850],
                        thickness: 1,
                        indent: 32,
                        endIndent: 32,
                    ),
                    Expanded(
                        flex : 95,
                        child: ListView.separated(
                            padding: EdgeInsets.all(8),
                            itemCount: 12,
                            itemBuilder: (BuildContext context, int idx) {
                                return Container(
                                    color: idx % 4 == 0 ? Colors.grey[350] : null,
                                    height: idx % 4 == 0 ? 30 : 45,
                                    child: Text(
                                        "ああああ",
                                        style: TextStyle(fontSize: idx % 4 == 0 ? 20 : 25),
                                    ),
                                );
                            },
                            separatorBuilder: (BuildContext context, int idx) {
                                return idx % 4 == 0 || idx % 4 == 3 ?
                                    SizedBox(width: 0, height: 0) :
                                    Divider(thickness: 1,);
                            },
                        ),
                    ),
                ],
            ),
            drawer: Drawer(
                child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget> [
                        DrawerHeader(
                            decoration: BoxDecoration(
                                color: Colors.orange[300],
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget> [
                                    Text(
                                        "白砂寮献立アプリ+",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                        ),
                                    ),
                                    Text(
                                        "Version 1.0.0",
                                        style: TextStyle(
                                            fontSize: 18,
                                        ),
                                    ),
                                ],
                            ),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget> [
                                    Text(
                                        "メニュー",
                                        style: TextStyle(fontSize: 15)
                                    ),
                                    Divider(
                                        thickness: 1,
                                    ),
                                    ListTile(
                                        leading: Icon(Icons.calendar_today),
                                        title: Text("日時指定")
                                    ),
                                    ListTile(
                                        leading: Icon(Icons.search),
                                        title: Text("献立検索")
                                    ),
                                    Text(
                                        "設定",
                                        style: TextStyle(fontSize: 15)
                                    ),
                                    Divider(
                                        thickness: 1,
                                    ),
                                    ListTile(
                                        leading: Icon(Icons.settings),
                                        title: Text("設定")
                                    ),
                                    Text(
                                        "その他",
                                        style: TextStyle(fontSize: 15),
                                    ),
                                    Divider(
                                        thickness: 1,
                                    ),
                                    ListTile(
                                        leading: Icon(Icons.info),
                                        title: Text("アプリ情報"),
                                    ),
                                ],
                            ),
                        ),
                    ],
                )
            ),
        );
    }
}
