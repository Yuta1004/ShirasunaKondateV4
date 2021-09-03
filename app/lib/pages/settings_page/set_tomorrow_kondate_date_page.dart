import "package:flutter/material.dart";
import "/settings/settings.dart";

class SetTomorrowKondateDatePage extends StatefulWidget {
    @override
    _SetTomorrowKondateDatePageState createState() => _SetTomorrowKondateDatePageState();
}

class _SetTomorrowKondateDatePageState extends State<SetTomorrowKondateDatePage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(
                    "設定",
                    style: TextStyle(fontWeight: FontWeight.bold)
                ),
            ),
            body: Text("時刻設定画面"),
        );
    }
}
