import "package:flutter/material.dart";
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
    @override
    _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    bool hasSwiped = false;
    DateTime displayingDate = DateTime.now();

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
                            child: buildDateText(),
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
                        child: GestureDetector(
                            onPanUpdate: (event) {
                                if(!hasSwiped) {
                                    if(event.delta.dx > 0) changeDisplayingDate(-1);
                                    if(event.delta.dx < 0) changeDisplayingDate(1);
                                    hasSwiped = true;
                                }
                            },
                            onPanEnd: (event) {
                                hasSwiped = false;
                            },
                            child: ListView.separated(
                                padding: EdgeInsets.all(8),
                                itemCount: 12,
                                itemBuilder: (BuildContext context, int idx) {
                                    return Container(
                                        color: idx % 4 == 0 ? Colors.grey[350] : null,
                                        height: idx % 4 == 0 ? 30 : 45,
                                        child: Text(
                                            DateFormat("y/M/d").format(displayingDate),
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

    Widget buildDateText() {
        final nowDate = DateTime.now();
        var dateText = DateFormat("M月d日 (W)").format(displayingDate);
        if(displayingDate.day == nowDate.add(Duration(days: -1)).day) {
            dateText = "昨日の献立";
        } else if(displayingDate.day == nowDate.add(Duration(days: 1)).day) {
            dateText = "明日の献立";
        } else if(displayingDate.day == nowDate.day) {
            dateText = "今日の献立";
        } else if(displayingDate.year != nowDate.year) {
            dateText = DateFormat("y年M月d日 (W)").format(displayingDate);
        }
        dateText = dateText.replaceAll("W", <String>["", "月", "火", "水", "木", "金", "土", "日"][displayingDate.weekday]);
        return Text(
            dateText,
            style: TextStyle(fontSize:30)
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

    void changeDisplayingDate(int days) {
        setState(() {
            displayingDate = displayingDate.add(Duration(days: days));
        });
    }
}
