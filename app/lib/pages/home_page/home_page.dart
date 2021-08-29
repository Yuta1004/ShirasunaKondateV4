import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
    @override
    _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(
                    "白砂寮献立アプリ",
                    style: TextStyle(fontWeight: FontWeight.bold)
                ),
            ),
        );
    }
}
