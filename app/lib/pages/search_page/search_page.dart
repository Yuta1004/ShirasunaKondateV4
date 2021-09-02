import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

class SearchPage extends StatefulWidget {
    @override
    _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
    final  _formKey = GlobalKey<FormState>();

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
