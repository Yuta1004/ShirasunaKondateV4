import "package:flutter/material.dart";

class SelectNutritivePage extends StatefulWidget {
    @override
    _SelectNutritivePageState createState() => _SelectNutritivePageState();
}

class _SelectNutritivePageState extends State<SelectNutritivePage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(
                    "設定",
                    style: TextStyle(fontWeight: FontWeight.bold)
                ),
            ),
            body: Text("Hello World"),
        );
    }
}
