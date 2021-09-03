import "package:flutter/material.dart";

class SetServerURLPage extends StatefulWidget {
    @override
    _SetServerURLPageState createState() => _SetServerURLPageState();
}

class _SetServerURLPageState extends State<SetServerURLPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(
                    "配信サーバURL",
                    style: TextStyle(fontWeight: FontWeight.bold)
                ),
            ),
            body: Text("Hello World"),
        );
    }
}
