import "package:flutter/material.dart";
import 'package:settings_ui/settings_ui.dart';
import "/settings/settings.dart";

class SettingsPage extends StatefulWidget {
    @override
    _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
    bool _displayTomorrowKondate = false;
    bool _displayNutritiveInfo = false;

    @override
    void initState() {
        super.initState();
        getDisplayTomorrowKondateSettings().then((val) {
            setState(() { _displayTomorrowKondate = val; });
        });
        getDisplayNutritiveInfoSettings().then((val) {
            setState(() { _displayNutritiveInfo = val; });
        });
    }

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
                                switchValue: _displayTomorrowKondate,
                                onToggle: (bool val) {
                                    setDisplayTomorrowKondateSettings(val);
                                    setState(() { _displayTomorrowKondate = val; });
                                },
                            ),
                            SettingsTile(
                                title: "時刻",
                                subtitle: "00:00から",
                                onPressed: (context) { Navigator.pushNamed(context, "/settings/set_tomorrow_kondate_date"); },
                            ),
                        ],
                    ),
                    SettingsSection(
                        title: "栄養情報表示",
                        tiles: <SettingsTile>[
                            SettingsTile.switchTile(
                                title: "有効にする",
                                switchValue: _displayNutritiveInfo,
                                onToggle: (bool val) {
                                    setDisplayNutritiveInfoSettings(val);
                                    setState(() { _displayNutritiveInfo = val; });
                                },
                            ),
                            SettingsTile(
                                title: "表示する栄養情報",
                                subtitle: "カロリー/塩分",
                            ),
                        ],
                    ),
                    SettingsSection(
                        title: "サーバ",
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
