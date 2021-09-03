import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";
import "package:sprintf/sprintf.dart";
import "/grpc/conn.dart";
import "/settings/settings.dart";

class SetServerURLPage extends StatefulWidget {
    @override
    _SetServerURLPageState createState() => _SetServerURLPageState();
}

class _SetServerURLPageState extends State<SetServerURLPage> {
    bool _nowLoading = false;
    final _formKey = GlobalKey<FormState>();
    TextEditingController _urlController = TextEditingController();

    @override
    void initState() {
        super.initState();
        getServerURL().then((val) {
            setState(() { _urlController.text = val; });
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(
                    "配信サーバ",
                    style: TextStyle(fontWeight: FontWeight.bold)
                ),
            ),
            body: Stack(
                children: <Widget>[
                    Column(
                        children: <Widget>[
                            Form(
                                key: _formKey,
                                child: Row(
                                    children: <Widget>[
                                        Expanded(
                                            flex: 8,
                                            child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 4),
                                                child: TextFormField(
                                                    controller: _urlController,
                                                    decoration: InputDecoration(
                                                        hintText: "配信サーバのアドレスを入力してください",
                                                    ),
                                                    validator: (String? value) {
                                                        if(value == null || value.isEmpty || Uri.parse(value).isAbsolute) {
                                                            return "正しいURL形式ではありません";
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
                                                    child: Text("セット"),
                                                    style: ElevatedButton.styleFrom(
                                                        primary: Colors.orange,
                                                    ),
                                                    onPressed: () async {
                                                        if(_formKey.currentState != null && _formKey.currentState!.validate() && !_nowLoading) {
                                                            setState(() { _nowLoading = true; });
                                                            checkServerAvailability(_urlController.text).then((isAvailable) {
                                                                setState(() { _nowLoading = false; });
                                                                if(isAvailable) { setServerURL(_urlController.text); }
                                                                showAlertDialog(context, isAvailable);
                                                            });
                                                        }
                                                    },
                                                ),
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                    "※必要時以外は変更しないでください",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                    ),
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
        );
    }

    Future<Null> showAlertDialog(BuildContext context, bool result) async {
        await showDialog(
            context: context,
            builder: (_) {
                return AlertDialog(
                    title: Text("接続チェック結果"),
                    content: Text(sprintf("配信サーバの接続チェックに%sしました", [result ? "成功" : "失敗"])),
                    actions: <Widget>[
                        TextButton(
                            child: Text("OK"),
                            onPressed: () => Navigator.pop(context),
                        )
                    ],
                );
            }
        );
    }
}
