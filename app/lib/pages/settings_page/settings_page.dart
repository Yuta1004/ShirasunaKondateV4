import "package:flutter/material.dart";

class SettingsPage extends StatefulWidget {
    @override
    _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(
                    "設定",
                    style: TextStyle(fontWeight: FontWeight.bold)
                ),
            ),
            body: Text("設定画面"),
        );
    }
}
