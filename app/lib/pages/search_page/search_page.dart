import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";
import "/grpc/utils.pb.dart";

class SearchPage extends StatefulWidget {
    @override
    _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
    final  _formKey = GlobalKey<FormState>();
    String _selectedTypeS = "breakfast";
    KondateType _selectedType = KondateType.BREAKFAST;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(
                    "献立検索",
                    style: TextStyle(fontWeight: FontWeight.bold)
                ),
                actions: <Widget> [
                    IconButton(
                        icon: Icon(Icons.help_outline),
                        tooltip: "ヘルプを見る",
                        onPressed: () {},
                    ),
                ],
            ),
            body: Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Stack(
                    children: <Widget>[
                        Column(
                            children: <Widget>[
                                Flexible(
                                    child: Form(
                                        key: _formKey,
                                        child: Row(
                                            children: <Widget>[
                                                Expanded(
                                                    flex: 8,
                                                    child: Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: 4),
                                                        child: TextFormField(
                                                            decoration: InputDecoration(
                                                                hintText: "検索したいメニューを入力してください",
                                                            ),
                                                            validator: (String? value) {
                                                                if(value == null || value.isEmpty) {
                                                                    return "メニュー名を入力してください";
                                                                }
                                                                return null;
                                                            },
                                                        ),
                                                    ),
                                                ),
                                                Expanded(
                                                    flex: 2,
                                                    child: Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: 4),
                                                        child: ElevatedButton(
                                                            child: Text("検索"),
                                                            style: ElevatedButton.styleFrom(
                                                                primary: Colors.orange,
                                                            ),
                                                            onPressed: () {
                                                                if(_formKey.currentState != null && _formKey.currentState!.validate()) {
                                                                    print("OK");
                                                                }
                                                            },
                                                        ),
                                                    ),
                                                ),
                                            ],
                                        ),
                                    ),
                                ),
                                Row(
                                    children: <Widget>[
                                        Expanded(
                                            flex: 10,
                                            child: Container(
                                                child: Row(
                                                    children: <Widget>[
                                                        Radio(
                                                            value: "breakfast",
                                                            groupValue: _selectedTypeS,
                                                            onChanged: (_) {
                                                                setState(() {
                                                                    _selectedTypeS = "breakfast";
                                                                    _selectedType = KondateType.BREAKFAST;
                                                                });
                                                            }
                                                        ),
                                                        Text(
                                                            "朝食",
                                                            style: TextStyle(fontSize: 18),
                                                        ),
                                                    ],
                                                ),
                                            ),
                                        ),
                                        Expanded(
                                            flex: 10,
                                            child: Container(
                                                child: Row(
                                                    children: <Widget>[
                                                        Radio(
                                                            value: "lunch",
                                                            groupValue: _selectedTypeS,
                                                            onChanged: (_) {
                                                                setState(() {
                                                                    _selectedTypeS = "lunch";
                                                                    _selectedType = KondateType.LUNCH;
                                                                });
                                                            },
                                                        ),
                                                        Text(
                                                            "昼食",
                                                            style: TextStyle(fontSize: 18),
                                                        ),
                                                    ],
                                                ),
                                            ),
                                        ),
                                        Expanded(
                                            flex: 7,
                                            child: Container(
                                                child: Row(
                                                    children: <Widget>[
                                                        Radio(
                                                            value: "dinner",
                                                            groupValue: _selectedTypeS,
                                                            onChanged: (_) {
                                                                setState(() {
                                                                    _selectedTypeS = "dinner";
                                                                    _selectedType = KondateType.DINNER;
                                                                });
                                                            },
                                                        ),
                                                        Text(
                                                            "夕食",
                                                            style: TextStyle(fontSize: 18),
                                                        ),
                                                    ],
                                                ),
                                            ),
                                        ),
                                    ],
                                ),
                                Padding(
                                    padding: EdgeInsets.symmetric(vertical: 4),
                                    child: Divider(
                                        thickness: 1,
                                        indent: 0,
                                        endIndent: 0,
                                    ),
                                ),
                            ],
                        ),
                        Visibility(
                            visible: false,
                            child: SpinKitCircle(
                                color: Colors.orange,
                                size: 100.0,
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}
