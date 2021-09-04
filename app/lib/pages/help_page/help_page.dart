import "package:flutter/material.dart";

class HelpPage extends StatefulWidget {
    @override
    _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
   @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(
                    "アプリの使い方",
                    style: TextStyle(fontWeight: FontWeight.bold)
                ),
            ),
            body: Text("Hello World"),
        );
    }
}
