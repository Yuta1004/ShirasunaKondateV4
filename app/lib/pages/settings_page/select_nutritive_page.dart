import "package:flutter/material.dart";
import "package:settings_ui/settings_ui.dart";
import "package:marquee_widget/marquee_widget.dart";

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
                    "表示する栄養情報",
                    style: TextStyle(fontWeight: FontWeight.bold)
                ),
            ),
            body: Column(
                children: <Widget>[
                    SettingsSection(
                        tiles: <SettingsTile>[
                            SettingsTile.switchTile(
                                title: "カロリー",
                                switchValue: true,
                                onToggle: (bool val) {},
                            ),
                            SettingsTile.switchTile(
                                title: "タンパク質",
                                switchValue: true,
                                onToggle: (bool val) {},
                            ),
                            SettingsTile.switchTile(
                                title: "脂質",
                                switchValue: true,
                                onToggle: (bool val) {},
                            ),
                            SettingsTile.switchTile(
                                title: "炭水化物",
                                switchValue: true,
                                onToggle: (bool val) {},
                            ),
                            SettingsTile.switchTile(
                                title: "塩分",
                                switchValue: true,
                                onToggle: (bool val) {},
                            ),
                        ],
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Container(),
                    ),
                    Text(
                        "表示例",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                        ),
                    ),
                    Container(
                        color: Colors.grey[350],
                        height: 30,
                        child: Row(
                            children: <Widget>[
                                Expanded(
                                    flex: 1,
                                    child: Center(
                                        child: Text(
                                            "朝食",
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
                                        child: Text(
                                            "あああああああああ",
                                            style: TextStyle(fontSize: 18)
                                        ),
                                    ),
                                ),
                            ],
                        ),
                    ),
                ],
            ),
        );
    }
}
