import "package:flutter/material.dart";
import "package:marquee_widget/marquee_widget.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher.dart';
import "/grpc/conn.dart";
import "/db/model.dart";
import "/db/manage.dart";
import "/utils/date.dart";
import "/utils/nutritive.dart";
import "/settings/settings.dart";

class HomePage extends StatefulWidget {
    @override
    _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    bool _hasSwiped = false;
    bool _nowLoading = false;
    DateTime _displayingDate = DateTime.now();
    Widget _kondateListView = ListView();

    @override
    void initState() {
        super.initState();
        getDisplayTomorrowKondateSettings().then((isEnabled) async {
            if(isEnabled) {
                final advanceDate = _displayingDate.isAfter(await getDisplayTomorrowKondateTimeSettings());
                _displayingDate = _displayingDate.add(Duration(days: advanceDate ? 1 : 0));
            }
            _updateKondateListView(_displayingDate);
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
                        icon: Icon(Icons.calendar_today),
                        tooltip: "日時指定",
                        onPressed: () { _setDisplayingDate(context); },
                    ),
                    IconButton(
                        icon: Icon(Icons.home),
                        tooltip: "今日の献立",
                        onPressed: () {
                            _displayingDate = DateTime.now();
                            _updateKondateListView(_displayingDate);
                        },
                    ),
                ],
            ),
            body: Stack(
                children: <Widget>[
                    Column(
                        children: <Widget> [
                            Flexible(
                                flex: 7,
                                child: Container(
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    child: Center(
                                        child: Text(
                                            genAppropirateDateText(_displayingDate),
                                            style: TextStyle(fontSize: 30),
                                        ),
                                    ),
                                ),
                            ),
                            Flexible(
                                flex : 93,
                                child: GestureDetector(
                                    onPanUpdate: (event) {
                                        if(!_hasSwiped && !_nowLoading) {
                                            _hasSwiped = true;
                                            _displayingDate = _displayingDate.add(Duration(days: event.delta.dx > 0 ? -1 : 1));
                                            _updateKondateListView(_displayingDate);
                                        }
                                    },
                                    onPanEnd: (event) { _hasSwiped = false; },
                                    child: _kondateListView,
                                ),
                            ),
                        ],
                    ),
                    Visibility(
                        visible: _nowLoading,
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
                                    Text(
                                        "©2021 Yuta Nakagami",
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
                                    ListTile(
                                        leading: Icon(Icons.search),
                                        title: Text("献立検索"),
                                        onTap: () { Navigator.pushNamed(context, "/search"); },
                                    ),
                                    ListTile(
                                        leading: Icon(Icons.settings),
                                        title: Text("設定"),
                                        onTap: () {
                                            Navigator.pushNamed(context, "/settings").then((_) {
                                                setState(() {
                                                    _displayingDate = _displayingDate.add(Duration(seconds: 1));
                                                    _updateKondateListView(_displayingDate).then((_){});
                                                });
                                            });
                                        }
                                    ),
                                    ListTile(
                                        leading: Icon(Icons.help),
                                        title: Text("アプリの使い方"),
                                    ),
                                    ListTile(
                                        leading: Icon(Icons.offline_share),
                                        title: Text("欠食システムを開く"),
                                        onTap: () async { await _openOfficialKondateSystem(context); },
                                    ),
                                ],
                            ),
                        ),
                    ],
                )
            ),
        );
    }

    Future<Null> _setDisplayingDate(BuildContext context) async {
        final nowDate = DateTime.now();
        final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: _displayingDate,
            firstDate: nowDate.add(Duration(days: -365*5)),
            lastDate: nowDate.add(Duration(days: 365*10))
        );
        if(picked != null) {
            setState(() {
                _displayingDate = picked;
                _updateKondateListView(_displayingDate);
            });
        }
    }

    Future<Null> _updateKondateListView(DateTime date) async {
        setState(() {
            _nowLoading = true;
        });

        // displayNutritive => ON/OFF
        final displayNutritive = await getDisplayNutritiveInfoSettings();
        final nutritiveDetailsTable = await getDisplayNutritiveInfoDetailsSettings();
        nutritiveDetailsTable.updateAll((k, v) => v && displayNutritive);

        getKondateData(_displayingDate).then((data) {
            setState(() {
                if(data.length > 0) {
                    _kondateListView = _buildKondateListView(nutritiveDetailsTable, data);
                } else {
                    _kondateListView = ListView(
                        children: [
                            Center(
                                child: Text(
                                    "表示できるデータがありません",
                                    style: TextStyle(fontSize: 20),
                                ),
                            ),
                        ],
                    );
                }
                _nowLoading = false;
            });
        });
    }

    Widget _buildKondateListView(Map<Nutritive, bool> nutritiveDetailsTable, List<KondateData> data) {
        // item1=>text, item2=>isTitle, item3=>hasSeparater, item4=>nutritive_info
        var menuDisplayInfo = <Tuple4>[];
        final typeNames = ["朝食", "昼食", "夕食"];
        data.asMap().forEach((type, kondate) {
            menuDisplayInfo.add(Tuple4(typeNames[type], true, false, genFormattedNutritiveText(nutritiveDetailsTable, kondate.info)));
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
                                    pauseDuration: Duration(seconds: 1),
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

    Future<Null> _openOfficialKondateSystem(BuildContext context) async {
        Navigator.pop(context);
        await showDialog(
            context: context,
            builder: (BuildContext context) {
                return AlertDialog(
                    title: Text("確認"),
                    content: Text("欠食システムを開いても良いですか?(ブラウザが起動します)"),
                    actions: <Widget>[
                        TextButton(
                            child: Text("キャンセル"),
                            onPressed: () { Navigator.of(context).pop(0); }
                        ),
                        TextButton(
                            child: Text("OK"),
                            onPressed: () async {
                                Navigator.of(context).pop(1);
                                final url = "https://shirasunaryou.sakura.ne.jp/cgi-bin/shirasuna/GAIHAKU/login.cgi?guid=ON";
                                if(await canLaunch(url)) launch(url);
                            },
                        ),
                    ],
                );
            },
        );
    }
}
