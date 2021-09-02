import "package:flutter/material.dart";
import "package:marquee_widget/marquee_widget.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";
import 'package:tuple/tuple.dart';
import "/grpc/conn.dart";
import "/db/model.dart";
import "/db/manage.dart";
import "/utils/date.dart";

class HomePage extends StatefulWidget {
    @override
    _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    bool hasSwiped = false;
    bool nowLoading = false;
    DateTime displayingDate = DateTime.now();
    Widget kondateListView = ListView();

    _HomePageState() {
        existsTables().then((exists) {
            if(!exists) createTables().then((_){});
        });
    }

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
            body: Stack(
                children: <Widget>[
                    Column(
                        children: <Widget> [
                            Expanded(
                                flex: 7,
                                child: Container(
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    child: Center(
                                        child: Text(
                                            genAppropirateDateText(displayingDate),
                                            style: TextStyle(fontSize: 30),
                                        ),
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
                                flex : 93,
                                child: GestureDetector(
                                    onPanUpdate: (event) {
                                        if(!hasSwiped) {
                                            hasSwiped = true;
                                            displayingDate = displayingDate.add(Duration(days: event.delta.dx > 0 ? -1 : 1));
                                            updateKondateListView(displayingDate);
                                        }
                                    },
                                    onPanEnd: (event) { hasSwiped = false; },
                                    child: kondateListView,
                                ),
                            ),
                        ],
                    ),
                    Visibility(
                        visible: nowLoading,
                        child: SpinKitCircle(
                            color: Colors.orange,
                            size: 100.0,
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
                                        title: Text("日時指定"),
                                        onTap: () { setDisplayingDate(context); },
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

    Future<Null> setDisplayingDate(BuildContext context) async {
        Navigator.pop(context);
        final nowDate = DateTime.now();
        final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: displayingDate,
            firstDate: nowDate.add(Duration(days: -365*5)),
            lastDate: nowDate.add(Duration(days: 365*10))
        );
        if(picked != null) {
            setState(() { displayingDate = picked; });
        }
    }

    Future<Null> updateKondateListView(DateTime date) async {
        setState(() {
            nowLoading = true;
        });
        getKondateData(displayingDate).then((data) {
            setState(() {
                if(data.length > 0) {
                    kondateListView = buildKondateListView(data);
                }
                nowLoading = false;
            });
        });
    }

    Widget buildKondateListView(List<KondateData> data) {
        // item1=>text, item2=>isTitle, item3=>hasSeparater, item4=>nutritive_info
        var menuDisplayInfo = <Tuple4>[];
        final typeNames = ["朝食", "昼食", "夕食"];
        data.asMap().forEach((type, kondate) {
            menuDisplayInfo.add(Tuple4(typeNames[type], true, false, ""));
            kondate.info.menu.asMap().forEach((idx, menu) {
                menuDisplayInfo.add(Tuple4(menu, false, idx != kondate.info.menu.length-1, ""));
            });
        });

        return ListView.separated(
            padding: EdgeInsets.all(8),
            itemCount: menuDisplayInfo.length,
            itemBuilder: (BuildContext context, int idx) {
                var text = menuDisplayInfo[idx].item1;
                var isTitle = menuDisplayInfo[idx].item2;
                var nutritiveInfo = menuDisplayInfo[idx].item4;
                var child;
                if(isTitle) {
                    child = Row(
                        children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: Center(
                                    child: Text(
                                        text,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                        ),
                                    ),
                                ),
                            ),
                            Expanded(
                                flex: 9,
                                child: Marquee(
                                    child: Text(
                                        nutritiveInfo,
                                        style: TextStyle(fontSize: 18)
                                    ),
                                ),
                            ),
                        ],
                    );
                } else {
                    child = Text(text, style: TextStyle(fontSize: 20));
                }
                return Container(
                    color: isTitle ? Colors.grey[350] : null,
                    height: isTitle ? 30 : 40,
                    alignment: Alignment.centerLeft,
                    child: child,
                );
            },
            separatorBuilder: (BuildContext context, int idx) {
                var hasSeparater = menuDisplayInfo[idx].item3;
                return hasSeparater ? Divider(thickness: 1) : SizedBox(width: 0, height: 0);
            },
        );
    }
}
