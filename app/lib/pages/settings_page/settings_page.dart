import "package:flutter/material.dart";
import 'package:settings_ui/settings_ui.dart';

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
            body: Column(
                children: <Widget>[
                    SettingsSection(
                        title: "起動時に翌日の献立を表示",
                        tiles: <SettingsTile>[
                            SettingsTile.switchTile(
                                title: "有効にする",
                                switchValue: true,
                                onToggle: (bool value) {},
                            ),
                            SettingsTile(
                                title: "時刻",
                                subtitle: "00:00から",
                            ),
                        ],
                    ),
                    SettingsSection(
                        title: "栄養情報表示",
                        tiles: <SettingsTile>[
                            SettingsTile.switchTile(
                                title: "有効にする",
                                switchValue: true,
                                onToggle: (bool value) {},
                            ),
                            SettingsTile(
                                title: "表示する栄養情報",
                                subtitle: "カロリー/塩分",
                            ),
                        ],
                    ),
                    SettingsSection(
                        title: "その他",
                        tiles: <SettingsTile>[
                            SettingsTile(
                                title: "配信サーバURL",
                                subtitle: "https://www.aaa.example.com",
                            ),
                        ],
                    ),
                ],
            ),
        );
    }
}
